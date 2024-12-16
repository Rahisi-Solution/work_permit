import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/survey_checkllist/local_inspections/step1.dart';
import 'package:wps_survey/survey_checkllist/local_inspections/step2.dart';
import 'package:wps_survey/survey_checkllist/local_inspections/step3.dart';
import 'package:wps_survey/survey_checkllist/local_inspections/step4.dart';
import 'package:wps_survey/utils/config.dart';

import '../../helper/appcolors.dart';

class LocalEmployeeStepperHome extends StatefulWidget {
  const LocalEmployeeStepperHome({super.key});

  @override
  State<LocalEmployeeStepperHome> createState() => _LocalEmployeeStepperHomeState();
}

class _LocalEmployeeStepperHomeState extends State<LocalEmployeeStepperHome> {
  int activeStep = 0;
  final int totalSteps = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'Inspection checklist',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.xmark,
            size: SizeConfig.widthMultiplier * 6,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 100,
        child: Column(
          children: [
            NumberStepper(
              numbers: const [1, 2, 3, 4, 5, 6, 7],
              lineLength: SizeConfig.widthMultiplier * 5,
              activeStepBorderColor: Colors.transparent,
              enableStepTapping: false,
              activeStep: activeStep,
              stepRadius: 13,
              lineDotRadius: 0.8,
              alignment: Alignment.center,
              activeStepColor: const Color(0xFF037971),
              stepReachedAnimationEffect: Curves.ease,
              stepReachedAnimationDuration: const Duration(seconds: 2),
              scrollingDisabled: true,
              lineColor: Colors.grey[500],
              stepPadding: 0,
              enableNextPreviousButtons: false,
              numberStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            Expanded(
              child: stepsSection(activeStep),
            ),
            Padding(
              padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 35,
                    height: SizeConfig.heightMultiplier * 5.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (activeStep > 0) {
                          goToPreviousStep();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: activeStep > 0
                          ? Text(
                              'Previous',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: SizeConfig.textMultiplier * 1.8,
                              ),
                            )
                          : Text(
                              'Cancel',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: SizeConfig.textMultiplier * 1.8,
                              ),
                            ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.widthMultiplier * 35,
                    height: SizeConfig.heightMultiplier * 5.5,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (activeStep == 0) {
                          // _step1Validation();
                          goToNextStep();
                        } else if (activeStep == 1) {
                          goToNextStep();
                        } else {
                          goToNextStep();
                        }
                      },
                      child: activeStep == 6
                          ? Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 1.8,
                              ),
                            )
                          : Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 1.8,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stepsSection(int step) {
    switch (step) {
      case 0:
        return const Step1();
      case 1:
        return Step2();
      case 2:
        return const Step3();
      case 3:
        return const Step4();
      default:
        return const Center(
          child: Text(
            'Unknown Step',
            style: TextStyle(fontSize: 20),
          ),
        );
    }
  }

  void goToPreviousStep() {
    setState(() {
      if (activeStep > 0) activeStep--;
    });
  }

  void goToNextStep() {
    setState(() {
      if (activeStep < totalSteps - 1) activeStep++;
    });
  }

  _step1Validation() {
    if (Step1.employerName.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter name of employer/owner", context);
    } else if (Step1.emailAddress.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter address/email", context);
    } else if (Step1.industryNature.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter industry nature", context);
    } else if (Step1.businessNature.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter business nature", context);
    } else if (Step1.previousInspector.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter previous inspector name", context);
    } else if (Step1.maleLocal.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter total male(local)", context);
    } else if (Step1.femaleLocal.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter total female(local)", context);
    } else if (Step1.maleForeigner.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter total male(foreigner)", context);
    } else if (Step1.femaleForeigner.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter total female(foreigner)", context);
    } else if (Step1.interviewedPerson.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter name of interviewed person", context);
    } else if (Step1.interviewedPeople.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter total of interviewed people", context);
    } else if (Step1.tradeUnion.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter trade union", context);
    } else {
      goToNextStep();
    }
  }
}
