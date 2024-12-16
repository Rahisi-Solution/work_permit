import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/survey_model.dart';
import '../utils/config.dart';
import '../utils/database_helper.dart';

class SurveyProvider with ChangeNotifier {
  List<Survey> _surveys = [];
  final dbHelper = DatabaseHelper();

  List<Survey> get surveys => _surveys;

  Future<void> fetchAndCacheSurveys() async {
    String url = Config.allSurveys;
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? authToken = preferences.getString(Config.token);
    String postedData = "authorization=Bearer $authToken";

    try {
      Response response = await dio.post(
        url,
        data: postedData,
        options: options,
      );
      debugPrint('Fetch survey from provider response🙋: $response');
      dynamic decodedString = jsonDecode(response.toString());
      dynamic inspectorResult = decodedString['response'];
      dynamic code = inspectorResult['code'];
      String message = inspectorResult['message'];

      if (code == 200) {
        dynamic surveyList = inspectorResult["data"];
        await dbHelper.clearSurveys();
        _surveys = surveyList.map((data) {
          final survey = Survey.fromMap(data);
          dbHelper.insertSurvey(survey.toMap());
          debugPrint("Surveys: $survey");
          return survey;
        }).toList();
        notifyListeners();
      } else {
        debugPrint("Error on inserting to offline DB");
      }
    } catch (Exception) {}
  }

  Future<void> loadSurveysFromDatabase() async {
    final data = await dbHelper.getSurveys();
    _surveys = data.map((map) => Survey.fromMap(map)).toList();
    debugPrint("Data from database: $_surveys");
    notifyListeners();
  }

  Future<void> syncSurveys() async {
    await fetchAndCacheSurveys();
  }
}
