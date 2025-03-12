import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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

class RejectedSurveys extends StatefulWidget {
  const RejectedSurveys({super.key});

  @override
  State<RejectedSurveys> createState() => _RejectedSurveysState();
}

class _RejectedSurveysState extends State<RejectedSurveys> {
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
            return Consumer<SurveyProvider>(
              builder: (context, surveyProvider, child) {
                final rejectedSurveys = surveyProvider.surveys.where((survey) => survey.status == "Rejected").toList();
                if (rejectedSurveys.isEmpty) {
                  return Center(
                    child: Text(
                      "No rejected survey(s)",
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
                      if (survey.status == "Rejected") {
                        return newVersion2(survey);
                      } else {
                        return Container();
                      }
                    },
                  );
                }
              },
            );
          }
        },
      ),
    );
  }

  _rejectedSurveys(dynamic data) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? cardColor;
    if (themeProvider.isDarkMode) {
      cardColor = const Color(0XFFf7cad0).withOpacity(0.8);
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
                  left: SizeConfig.widthMultiplier * 3,
                  right: SizeConfig.widthMultiplier * 1,
                  top: SizeConfig.widthMultiplier * 1,
                  bottom: SizeConfig.widthMultiplier * 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.building_2_fill,
                          size: SizeConfig.widthMultiplier * 4,
                          color: const Color(0xffd62839).withOpacity(0.5),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          data.institution,
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 1.0),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          size: SizeConfig.widthMultiplier * 4,
                          color: const Color(0xffd62839).withOpacity(0.5),
                        ),
                        const SizedBox(width: 5),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.paperclip,
                              size: SizeConfig.widthMultiplier * 4,
                              color: const Color(0xffd62839).withOpacity(0.5),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              data.referenceNumber,
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2,
                                color: AppColors.primaryColor.withOpacity(0.6),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd62839).withOpacity(0.5),
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
                    color: Color(0xffd62839),
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

  newVersion2(dynamic data) {
    return GestureDetector(
      onTap: () {
        fetchSingleSurvey(data.referenceNumber);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: SizeConfig.heightMultiplier * 12,
          width: SizeConfig.widthMultiplier * 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: SizeConfig.widthMultiplier * 25,
                  height: SizeConfig.heightMultiplier * 12,
                  decoration: BoxDecoration(
                    color: const Color(0xffd62839).withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.briefcase,
                      color: Colors.white,
                      size: SizeConfig.widthMultiplier * 10,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.institution,
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            color: AppColors.primaryColor.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                        Row(
                          children: [
                            Text(
                              "REF : ",
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Text(
                              data.referenceNumber,
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                color: const Color(0xffd62839).withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(CupertinoIcons.calendar, size: SizeConfig.widthMultiplier * 6),
                            const SizedBox(width: 2),
                            Text(
                              formatDate(data.initiatedDate),
                              style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 1.8,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
      if (code == 200) {
        DialogBuilder(context).hideOpenDialog();
        dynamic data = inspectorResult["data"];
        debugPrint("View survey data 💁 : $data");
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          barrierColor: AppColors.primaryColor.withOpacity(0.5),
          builder: (_) => SurveyDetails(data: data),
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
    if (survey != null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        barrierColor: AppColors.primaryColor.withOpacity(0.5),
        builder: (_) => SurveyDetails(
          data: survey,
        ),
      );
    } else {
      print('No survey found with reference number $referenceNumber');
      Config.customFlushbar("Missing survey", "Please login again", context);
    }
  }
}
