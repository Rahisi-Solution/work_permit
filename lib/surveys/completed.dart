import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/surveys/survey_details.dart';

import '../helper/appcolors.dart';
import '../provider/survey_provider.dart';
import '../provider/theme_provider.dart';
import '../utils/config.dart';
import '../utils/database_helper.dart';
import '../widgets/dialog_helper.dart';

class CompletedSurveys extends StatefulWidget {
  const CompletedSurveys({super.key});

  @override
  State<CompletedSurveys> createState() => _CompletedSurveysState();
}

class _CompletedSurveysState extends State<CompletedSurveys> {
  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    surveyProvider.loadSurveysFromDatabase();
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? textColor;
    if (themeProvider.isDarkMode) {
      textColor = Colors.white;
    } else {
      textColor = AppColors.primaryColor.withOpacity(0.5);
    }
    return Scaffold(
      body: FutureBuilder(
          future: surveyProvider.loadSurveysFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Consumer<SurveyProvider>(builder: (context, surveyProvider, child) {
                final completedSurveys = surveyProvider.surveys.where((survey) => survey.status == "Completed").toList();
                if (completedSurveys.isEmpty) {
                  return Center(
                    child: Text(
                      "No completed survey(s)",
                      style: TextStyle(
                        color: textColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: surveyProvider.surveys.length,
                    itemBuilder: (context, index) {
                      final survey = surveyProvider.surveys[index];
                      if (survey.status == "Completed") {
                        return _completedSurveys(survey);
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              });
            }
          }),
    );
  }

  _completedSurveys(dynamic data) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? cardColor;
    if (themeProvider.isDarkMode) {
      cardColor = Color(0XFFb7e4c7).withOpacity(0.8);
    } else {
      cardColor = AppColors.primaryColor.withOpacity(0.05);
    }
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          // _viewSurvey(data.referenceNumber);
          fetchSingleSurvey(data.referenceNumber);
        },
        child: Container(
          width: SizeConfig.widthMultiplier * 100,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.primaryColor.withOpacity(0.05),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier * 5,
                  right: SizeConfig.widthMultiplier * 5,
                  top: SizeConfig.widthMultiplier * 1,
                  bottom: SizeConfig.widthMultiplier * 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.institution,
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 1.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Location : ",
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2,
                            color: AppColors.primaryColor.withOpacity(0.6),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.location,
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 2,
                              color: AppColors.primaryColor.withOpacity(0.6),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 1.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Date : ",
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2,
                            color: AppColors.primaryColor.withOpacity(0.6),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              formatDate(data.initiatedDate),
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                child: Container(
                  width: SizeConfig.widthMultiplier * 2,
                  decoration: const BoxDecoration(
                    color: Color(0xff008000),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd-MM-yyyy').format(parsedDate);
  }

  _viewSurvey(String reference) async {
    String url = Config.viewSurvey;
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? auth_token = preferences.getString(Config.token);
    String postedData = "authorization=Bearer $auth_token&reference_number=$reference";

    DialogBuilder(context).showLoadingIndicator('Viewing');

    try {
      Response response = await dio.post(
        url,
        data: postedData,
        options: options,
      );
      debugPrint('View survey response: $response');

      dynamic decodedString = jsonDecode(response.toString());
      dynamic inspectorResult = decodedString['response'];

      dynamic code = inspectorResult['code'];
      String message = inspectorResult['message'];
      if (code == 200 && mounted) {
        DialogBuilder(context).hideOpenDialog();
        dynamic data = inspectorResult["data"];
        debugPrint("View survey data 💁 : $data");
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          barrierColor: AppColors.primaryColor.withOpacity(0.5),
          builder: (_) => SurveyDetails(
            data: data,
          ),
        );
      } else {
        DialogBuilder(context).hideOpenDialog();
        Config.customFlushbar("Notice", message, context);
      }
    } on DioException catch (Exception) {
      DialogBuilder(context).hideOpenDialog();
      Config.customFlushbar("Network error", "Please check your internet", context);
    } catch (Exception) {
      DialogBuilder(context).hideOpenDialog();
      Config.customFlushbar("Notice", Exception.toString(), context);
    }
  }

  void fetchSingleSurvey(String referenceNumber) async {
    DatabaseHelper dbHelper = DatabaseHelper();

    Map<String, dynamic>? survey = await dbHelper.getSingleSurvey(referenceNumber);
    if (survey != null && mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        barrierColor: AppColors.primaryColor.withOpacity(0.5),
        builder: (_) => SurveyDetails(
          data: survey,
        ),
      );
    } else {
      if (mounted) {
        Config.customFlushbar("Missing survey", "Please login again", context);
      }
    }
  }
}
