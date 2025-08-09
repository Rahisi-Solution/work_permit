import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/inspections/step1.dart';
import 'package:wps_survey/inspections/step2.dart';
import 'package:wps_survey/inspections/step3.dart';
import 'package:wps_survey/inspections/step4.dart';
import 'package:wps_survey/inspections/step5.dart';
import 'package:wps_survey/inspections/step6.dart';
import 'package:wps_survey/inspections/step7.dart';
import 'package:wps_survey/utils/config.dart';
import 'package:wps_survey/widgets/confirm_dialog.dart';

import '../helper/appcolors.dart';
import '../widgets/dialog_helper.dart';

class InspectionForm extends StatefulWidget {
  final dynamic splashData;
  const InspectionForm({super.key, this.splashData});

  @override
  State<InspectionForm> createState() => _InspectionFormState();
}

class _InspectionFormState extends State<InspectionForm> {
  int activeStep = 0;
  final int totalSteps = 7;

  @override
  void initState() {
    _fetchInitialData();
    super.initState();
  }

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
                          _step1Validation();
                          // goToNextStep();
                        } else if (activeStep == 1) {
                          _step2Validation();
                          // goToNextStep();
                        } else if (activeStep == 2) {
                          _step3Validation();
                          // goToNextStep();
                        } else if (activeStep == 3) {
                          _step4Validation();
                          // goToNextStep();
                        } else if (activeStep == 4) {
                          _step5Validation();
                          // goToNextStep();
                        } else if (activeStep == 5) {
                          _step6Validation();
                          // goToNextStep();
                        } else if (activeStep == 6) {
                          _step7Validation();
                          // goToNextStep();
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
        return Step1(splashData: widget.splashData);
      case 1:
        return Step2();
      case 2:
        return const Step3();
      case 3:
        return const Step4();
      case 4:
        return const Step5();
      case 5:
        return const Step6();
      case 6:
        return const Step7();
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
    if (Step1.institutionName == null) {
      Config.customFlushbar("Notice", "Please select institution", context);
    } else if (Step1.employerName.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter name of employer/owner", context);
    } else if (Step1.emailAddress.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter address/email", context);
    } else if (Step1.selectedLocation.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter location", context);
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
    } else if (Step1.other.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter other union", context);
    } else {
      goToNextStep();
    }
  }

  _step2Validation() {
    if (Step2.compliancePermanent == null) {
      Config.customFlushbar("Notice", "Please select permanent compliance", context);
    } else if (Step2.priorityPermanent == null) {
      Config.customFlushbar("Notice", "Please select Permanent Priority", context);
    } else if (Step2.compliancePermanent == "No" && Step2.actionPermanent.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Permanent Action if no Compliance", context);
    } else if (Step2.workersPermanent.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Permanent No. Of Workers Affected", context);
    } else if (Step2.permanent?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Permanent Deadline Of Correction", context);
    } else if (Step2.complianceFixed == null) {
      Config.customFlushbar("Notice", "Please select fixed compliance", context);
    } else if (Step2.priorityFixed == null) {
      Config.customFlushbar("Notice", "Please select Fixed Priority", context);
    } else if (Step2.complianceFixed == "No" && Step2.actionFixed.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Fixed Action if no Compliance", context);
    } else if (Step2.workersFixed.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Fixed No. Of Workers Affected", context);
    } else if (Step2.fixed?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Fixed Deadline Of Correction", context);
    } else if (Step2.compliancePartTime == null) {
      Config.customFlushbar("Notice", "Please select Part Time compliance", context);
    } else if (Step2.priorityPartTime == null) {
      Config.customFlushbar("Notice", "Please select Part Time Priority", context);
    } else if (Step2.compliancePartTime == "No" && Step2.actionPartTime.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Part Time Action if no Compliance", context);
    } else if (Step2.workersPartTime.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Part Time No. Of Workers Affected", context);
    } else if (Step2.partTime?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Part Time Deadline Of Correction", context);
    } else if (Step2.complianceDailyPaid == null) {
      Config.customFlushbar("Notice", "Please select Daily Paid compliance", context);
    } else if (Step2.priorityDailyPaid == null) {
      Config.customFlushbar("Notice", "Please select Daily Paid Priority", context);
    } else if (Step2.complianceDailyPaid == "No" && Step2.actionDailyPaid.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Daily Paid Action if no Compliance", context);
    } else if (Step2.workersDailyPaid.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Daily Paid No. Of Workers Affected", context);
    } else if (Step2.dailyPaid?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Daily Paid Deadline Of Correction", context);
    } else if (Step2.complianceOralContract == null) {
      Config.customFlushbar("Notice", "Please select Oral Contract compliance", context);
    } else if (Step2.priorityOralContract == null) {
      Config.customFlushbar("Notice", "Please select Oral Contract Priority", context);
    } else if (Step2.complianceOralContract == "No" && Step2.actionOralContract.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Oral Contract Action if no Compliance", context);
    } else if (Step2.workersOralContract.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Oral Contract No. Of Workers Affected", context);
    } else if (Step2.oralContract?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Oral Contract Deadline Of Correction", context);
    } else if (Step2.complianceWorkingHours == null) {
      Config.customFlushbar("Notice", "Please select Working Hours compliance", context);
    } else if (Step2.priorityWorkingHours == null) {
      Config.customFlushbar("Notice", "Please select Working Hours Priority", context);
    } else if (Step2.complianceWorkingHours == "No" && Step2.actionWorkingHours.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Working Hours Action if no Compliance", context);
    } else if (Step2.workersWorkingHours.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Working Hours No. Of Workers Affected", context);
    } else if (Step2.workingHours?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Working Hours Deadline Of Correction", context);
    } else if (Step2.complianceOverTime == null) {
      Config.customFlushbar("Notice", "Please select Over Time compliance", context);
    } else if (Step2.priorityOverTime == null) {
      Config.customFlushbar("Notice", "Please select Over Time Priority", context);
    } else if (Step2.complianceOverTime == "No" && Step2.actionOverTime.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Over Time Action if no Compliance", context);
    } else if (Step2.workersOverTime.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Over Time No. Of Workers Affected", context);
    } else if (Step2.overTime?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Over Time Deadline Of Correction", context);
    } else {
      goToNextStep();
    }
  }

  _step3Validation() {
    if (Step3.complianceAnnualLeave == null) {
      Config.customFlushbar("Notice", "Please select Annual Leave compliance", context);
    } else if (Step3.priorityAnnualLeave == null) {
      Config.customFlushbar("Notice", "Please select Annual Leave Priority", context);
    } else if (Step3.complianceAnnualLeave == "No" && Step3.actionAnnualLeave.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Annual Leave Action if no Compliance", context);
    } else if (Step3.workersAnnualLeave.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Annual Leave No. Of Workers Affected", context);
    } else if (Step3.annualLeave?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Annual Leave Deadline Of Correction", context);
    } else if (Step3.complianceMaternityLeave == null) {
      Config.customFlushbar("Notice", "Please select Maternity Leave compliance", context);
    } else if (Step3.priorityMaternityLeave == null) {
      Config.customFlushbar("Notice", "Please select Maternity Leave Priority", context);
    } else if (Step3.complianceMaternityLeave == "No" && Step3.actionMaternityLeave.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Maternity Leave Action if no Compliance", context);
    } else if (Step3.workersMaternityLeave.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Maternity Leave No. Of Workers Affected", context);
    } else if (Step3.maternityLeave?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Maternity Leave Deadline Of Correction", context);
    } else if (Step3.complianceSickLeave == null) {
      Config.customFlushbar("Notice", "Please select Sick Leave compliance", context);
    } else if (Step3.prioritySickLeave == null) {
      Config.customFlushbar("Notice", "Please select Sick Leave Priority", context);
    } else if (Step3.complianceSickLeave == "No" && Step3.actionSickLeave.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Sick Leave Action if no Compliance", context);
    } else if (Step3.workersSickLeave.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Sick Leave No. Of Workers Affected", context);
    } else if (Step3.sickLeave?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Sick Leave Deadline Of Correction", context);
    } else if (Step3.complianceEmergenceLeave == null) {
      Config.customFlushbar("Notice", "Please select Temporary Emergence Leave compliance", context);
    } else if (Step3.priorityEmergenceLeave == null) {
      Config.customFlushbar("Notice", "Please select Temporary Emergence Leave Priority", context);
    } else if (Step3.complianceEmergenceLeave == "No" && Step3.actionEmergenceLeave.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Temporary Emergence Leave Action if no Compliance", context);
    } else if (Step3.workersEmergenceLeave.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Temporary Emergence Leave No. Of Workers Affected", context);
    } else if (Step3.emergenceLeave?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Temporary Emergence Leave Deadline Of Correction", context);
    } else if (Step3.complianceOffDays == null) {
      Config.customFlushbar("Notice", "Please select Off Days compliance", context);
    } else if (Step3.priorityOffDays == null) {
      Config.customFlushbar("Notice", "Please select Off Days Priority", context);
    } else if (Step3.complianceOffDays == "No" && Step3.actionOffDays.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Off Days Action if no Compliance", context);
    } else if (Step3.workersOffDays.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Off Days No. Of Workers Affected", context);
    } else if (Step3.offDays?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Off Days Deadline Of Correction", context);
    } else if (Step3.complianceHealthExam == null) {
      Config.customFlushbar("Notice", "Please select Health Exam compliance", context);
    } else if (Step3.priorityHealthExam == null) {
      Config.customFlushbar("Notice", "Please select Health Exam Priority", context);
    } else if (Step3.complianceHealthExam == "No" && Step3.actionHealthExam.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Off Days Action if no Compliance", context);
    } else if (Step3.workersHealthExam.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Health Exam No. Of Workers Affected", context);
    } else if (Step3.healthExam?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Health Exam Deadline Of Correction", context);
    } else if (Step3.compliancePublicHoliday == null) {
      Config.customFlushbar("Notice", "Please select Public Holiday compliance", context);
    } else if (Step3.priorityPublicHoliday == null) {
      Config.customFlushbar("Notice", "Please select Public Holiday Priority", context);
    } else if (Step3.compliancePublicHoliday == "No" && Step3.actionPublicHoliday.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Public Holiday Action if no Compliance", context);
    } else if (Step3.workersPublicHoliday.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Public Holiday No. Of Workers Affected", context);
    } else if (Step3.publicHoliday?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Public Holiday Deadline Of Correction", context);
    } else {
      goToNextStep();
    }
  }

  _step4Validation() {
    if (Step4.complianceMedical == null) {
      Config.customFlushbar("Notice", "Please select Medical Treatment Compliance", context);
    } else if (Step4.priorityMedical == null) {
      Config.customFlushbar("Notice", "Please select Medical Treatment Priority", context);
    } else if (Step4.complianceMedical == "No" && Step4.actionMedical.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Medical Treatment Action if no Compliance", context);
    } else if (Step4.workersMedical.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Medical Treatment No. of Workers Affected", context);
    } else if (Step4.medical?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Medical Treatment Deadline Of Correction", context);
    } else if (Step4.complianceVentilation == null) {
      Config.customFlushbar("Notice", "Please select Ventilation Compliance", context);
    } else if (Step4.priorityVentilation == null) {
      Config.customFlushbar("Notice", "Please select Ventilation Priority", context);
    } else if (Step4.complianceVentilation == "No" && Step4.actionVentilation.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Ventilation Action if no Compliance", context);
    } else if (Step4.workersVentilation.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Ventilation No. of Workers Affected", context);
    } else if (Step4.ventilation?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Ventilation Deadline Of Correction", context);
    } else if (Step4.complianceLighting == null) {
      Config.customFlushbar("Notice", "Please select Lighting Compliance", context);
    } else if (Step4.priorityLighting == null) {
      Config.customFlushbar("Notice", "Please select Lighting Priority", context);
    } else if (Step4.complianceLighting == "No" && Step4.actionLighting.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Lighting Action if no Compliance", context);
    } else if (Step4.workersLighting.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Lighting No. of Workers Affected", context);
    } else if (Step4.lighting?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Lighting Deadline Of Correction", context);
    } else if (Step4.complianceNoising == null) {
      Config.customFlushbar("Notice", "Please select Noising Compliance", context);
    } else if (Step4.priorityNoising == null) {
      Config.customFlushbar("Notice", "Please select Noising Priority", context);
    } else if (Step4.complianceNoising == "No" && Step4.actionNoising.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Noising Action if no Compliance", context);
    } else if (Step4.workersNoising.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Noising No. of Workers Affected", context);
    } else if (Step4.noising?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Noising Deadline Of Correction", context);
    } else if (Step4.complianceFire == null) {
      Config.customFlushbar("Notice", "Please select Fire Extinguishers Compliance", context);
    } else if (Step4.priorityFire == null) {
      Config.customFlushbar("Notice", "Please select Fire Extinguisher Priority", context);
    } else if (Step4.complianceFire == "No" && Step4.actionFire.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Fire Extinguisher Action if no Compliance", context);
    } else if (Step4.workersFire.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Fire Extinguisher No. of Workers Affected", context);
    } else if (Step4.fire?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Fire Extinguisher Deadline Of Correction", context);
    } else if (Step4.complianceFirstAid == null) {
      Config.customFlushbar("Notice", "Please select First Aid Kit Compliance", context);
    } else if (Step4.priorityFirstAid == null) {
      Config.customFlushbar("Notice", "Please select First Aid Kit Priority", context);
    } else if (Step4.complianceFirstAid == "No" && Step4.actionFirstAid.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter First Aid Kit Action if no Compliance", context);
    } else if (Step4.workersFirstAid.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter First Aid Kit No. of Workers Affected", context);
    } else if (Step4.firstAid?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select First Aid Kit Deadline Of Correction", context);
    } else if (Step4.complianceProtectiveEquipments == null) {
      Config.customFlushbar("Notice", "Please select Personal Protective Equipments Compliance", context);
    } else if (Step4.priorityProtectiveEquipments == null) {
      Config.customFlushbar("Notice", "Please select Personal Protective Equipments Priority", context);
    } else if (Step4.complianceProtectiveEquipments == "No" && Step4.actionProtectiveEquipments.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Protective Equipments Action if no Compliance", context);
    } else if (Step4.workersProtectiveEquipments.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Personal Protective Equipments No. of Workers Affected", context);
    } else if (Step4.protectiveEquipments?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Personal Protective Equipments Deadline Of Correction", context);
    } else {
      goToNextStep();
    }
  }

  _step5Validation() {
    if (Step5.complianceWorkersAccommodation == null) {
      Config.customFlushbar("Notice", "Please select Workers Accommodation Compliance", context);
    } else if (Step5.priorityWorkersAccommodation == null) {
      Config.customFlushbar("Notice", "Please select Workers Accommodation Priority", context);
    } else if (Step5.complianceWorkersAccommodation == "No" && Step5.actionWorkersAccommodation.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Workers Accommodation Action if no Compliance", context);
    } else if (Step5.workersWorkersAccommodation.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Workers Accommodation No. of Workers Affected", context);
    } else if (Step5.workersAccommodation?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Workers Accommodation Deadline Of Correction", context);
    } else if (Step5.complianceOneHourBreak == null) {
      Config.customFlushbar("Notice", "Please select One Hour Break Compliance", context);
    } else if (Step5.priorityOneHourBreak == null) {
      Config.customFlushbar("Notice", "Please select One Hour Break Priority", context);
    } else if (Step5.complianceOneHourBreak == "No" && Step5.actionOneHourBreak.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter One Hour Break Action if no Compliance", context);
    } else if (Step5.workersOneHourBreak.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter One Hour Break No. of Workers Affected", context);
    } else if (Step5.oneHourBreak?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select One Hour Break Deadline Of Correction", context);
    } else if (Step5.complianceSexualHarassment == null) {
      Config.customFlushbar("Notice", "Please select Sexual Harassment Compliance", context);
    } else if (Step5.prioritySexualHarassment == null) {
      Config.customFlushbar("Notice", "Please select Sexual Harassment Priority", context);
    } else if (Step5.complianceSexualHarassment == "No" && Step5.actionSexualHarassment.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Sexual Harassment Action if no Compliance", context);
    } else if (Step5.workersSexualHarassment.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Sexual Harassment No. of Workers Affected", context);
    } else if (Step5.sexualHarassment?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Sexual Harassment Deadline Of Correction", context);
    } else if (Step5.complianceHIVAIDS == null) {
      Config.customFlushbar("Notice", "Please select HIV/AIDS Compliance", context);
    } else if (Step5.priorityHIVAIDS == null) {
      Config.customFlushbar("Notice", "Please select HIV/AIDS Priority", context);
    } else if (Step5.complianceHIVAIDS == "No" && Step5.actionHIVAIDS.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter HIV/AIDS Action if no Compliance", context);
    } else if (Step5.workersHIVAIDS.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter HIV/AIDS No. of Workers Affected", context);
    } else if (Step5.HIVAIDS?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select HIV/AIDS Deadline Of Correction", context);
    } else if (Step5.complianceChildLabour == null) {
      Config.customFlushbar("Notice", "Please select Child Labour Compliance", context);
    } else if (Step5.priorityChildLabour == null) {
      Config.customFlushbar("Notice", "Please select Child Labour Priority", context);
    } else if (Step5.complianceChildLabour == "No" && Step5.actionChildLabour.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Child Labour Action if no Compliance", context);
    } else if (Step5.workersChildLabour.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Child Labour No. of Workers Affected", context);
    } else if (Step5.childLabour?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Child Labour Deadline Of Correction", context);
    } else if (Step5.complianceDisabledPeople == null) {
      Config.customFlushbar("Notice", "Please select People With Disability Compliance", context);
    } else if (Step5.priorityDisabledPeople == null) {
      Config.customFlushbar("Notice", "Please select People With Disability Priority", context);
    } else if (Step5.complianceDisabledPeople == "No" && Step5.actionDisabledPeople.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter People With Disability Action if no Compliance", context);
    } else if (Step5.workersDisabledPeople.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter People With Disability No. of Workers Affected", context);
    } else if (Step5.disabledPeople?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select People With Disability Deadline Of Correction", context);
    } else if (Step5.complianceNightShift == null) {
      Config.customFlushbar("Notice", "Please select Night Shift Compliance", context);
    } else if (Step5.priorityNightShift == null) {
      Config.customFlushbar("Notice", "Please select Night Shift Priority", context);
    } else if (Step5.complianceNightShift == "No" && Step5.actionNightShift.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Night Shift Action if no Compliance", context);
    } else if (Step5.workersNightShift.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Night Shift No. of Workers Affected", context);
    } else if (Step5.nightShift?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Night Shift Deadline Of Correction", context);
    } else {
      goToNextStep();
    }
  }

  _step6Validation() {
    if (Step6.complianceLocal == null) {
      Config.customFlushbar("Notice", "Please select Local Compliance", context);
    } else if (Step6.priorityLocal == null) {
      Config.customFlushbar("Notice", "Please select Local Priority", context);
    } else if (Step6.complianceLocal == "No" && Step6.actionLocal.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Local Action if no Compliance", context);
    } else if (Step6.workersLocal.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Local No. of Workers Affected", context);
    } else if (Step6.local?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Local Deadline Of Correction", context);
    } else if (Step6.complianceForeigner == null) {
      Config.customFlushbar("Notice", "Please select Foreigner Compliance", context);
    } else if (Step6.priorityForeigner == null) {
      Config.customFlushbar("Notice", "Please select Foreigner Priority", context);
    } else if (Step6.complianceForeigner == "No" && Step6.actionForeigner.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Foreigner Action if no Compliance", context);
    } else if (Step6.workersForeigner.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Foreigner No. of Workers Affected", context);
    } else if (Step6.foreigner?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Foreigner Deadline Of Correction", context);
    } else if (Step6.complianceCollectiveBargaining == null) {
      Config.customFlushbar("Notice", "Please select Collective Bargaining Compliance", context);
    } else if (Step6.priorityCollectiveBargaining == null) {
      Config.customFlushbar("Notice", "Please select Collective Bargaining Priority", context);
    } else if (Step6.complianceCollectiveBargaining == "No" && Step6.actionCollectiveBargaining.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Collective Bargaining Action if no Compliance", context);
    } else if (Step6.workersCollectiveBargaining.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Collective Bargaining No. of Workers Affected", context);
    } else if (Step6.collectiveBargaining?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Collective Bargaining Deadline Of Correction", context);
    } else if (Step6.complianceSocialSecurity == null) {
      Config.customFlushbar("Notice", "Please select Social Security Compliance", context);
    } else if (Step6.prioritySocialSecurity == null) {
      Config.customFlushbar("Notice", "Please select Social Security Priority", context);
    } else if (Step6.complianceSocialSecurity == "No" && Step6.actionSocialSecurity.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Social Security Action if no Compliance", context);
    } else if (Step6.workersSocialSecurity.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Social Security No. of Workers Affected", context);
    } else if (Step6.socialSecurity?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Social Security Deadline Of Correction", context);
    } else if (Step6.complianceSchemeOfService == null) {
      Config.customFlushbar("Notice", "Please select Scheme Of Service Compliance", context);
    } else if (Step6.prioritySchemeOfService == null) {
      Config.customFlushbar("Notice", "Please select Scheme Of Service Priority", context);
    } else if (Step6.complianceSchemeOfService == "No" && Step6.actionSchemeOfService.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Scheme Of Service Action if no Compliance", context);
    } else if (Step6.workersSchemeOfService.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Scheme Of Service No. of Workers Affected", context);
    } else if (Step6.schemeOfService?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Scheme Of Service Deadline Of Correction", context);
    } else if (Step6.complianceSalaryIncrement == null) {
      Config.customFlushbar("Notice", "Please select Salary Increment Compliance", context);
    } else if (Step6.prioritySalaryIncrement == null) {
      Config.customFlushbar("Notice", "Please select Salary Increment Priority", context);
    } else if (Step6.complianceSalaryIncrement == "No" && Step6.actionSalaryIncrement.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Salary Increment Action if no Compliance", context);
    } else if (Step6.workersSalaryIncrement.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Salary Increment No. of Workers Affected", context);
    } else if (Step6.salaryIncrement?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Salary Increment Deadline Of Correction", context);
    } else if (Step6.compliancePerformanceAppraisal == null) {
      Config.customFlushbar("Notice", "Please select Performance Appraisal Compliance", context);
    } else if (Step6.priorityPerformanceAppraisal == null) {
      Config.customFlushbar("Notice", "Please select Performance Appraisal Priority", context);
    } else if (Step6.compliancePerformanceAppraisal == "No" && Step6.actionPerformanceAppraisal.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Performance Appraisal Action if no Compliance", context);
    } else if (Step6.workersPerformanceAppraisal.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Performance Appraisal No. of Workers Affected", context);
    } else if (Step6.performanceAppraisal?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Performance Appraisal Deadline Of Correction", context);
    } else if (Step6.complianceSuccessionPlanning == null) {
      Config.customFlushbar("Notice", "Please select Succession Planning Compliance", context);
    } else if (Step6.prioritySuccessionPlanning == null) {
      Config.customFlushbar("Notice", "Please select Succession Planning Priority", context);
    } else if (Step6.complianceSuccessionPlanning == "No" && Step6.actionSuccessionPlanning.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Succession Planning Action if no Compliance", context);
    } else if (Step6.workersSuccessionPlanning.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Succession Planning No. of Workers Affected", context);
    } else if (Step6.successionPlanning?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Succession Planning Deadline Of Correction", context);
    } else if (Step6.complianceLabourTraining == null) {
      Config.customFlushbar("Notice", "Please select LabourTraining Compliance", context);
    } else if (Step6.priorityLabourTraining == null) {
      Config.customFlushbar("Notice", "Please select Labour Training  Priority", context);
    } else if (Step6.complianceLabourTraining == "No" && Step6.actionLabourTraining.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Labour Training Action if no Compliance", context);
    } else if (Step6.workersLabourTraining.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Labour Training No. of Workers Affected", context);
    } else if (Step6.labourTraining?.toLocal().toString().split(' ')[0] == null) {
      Config.customFlushbar("Notice", "Please select Labour Training Deadline Of Correction", context);
    } else {
      goToNextStep();
    }
  }

  _step7Validation() {
    if (Step7.remarks.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter Remarks", context);
    } else {
      _submitData();
    }
  }

  _submitData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? authToken = preferences.getString(Config.token);
    Map<String, dynamic> payload = {
      // "authorization": "Bearer $authToken",
      "general": {
        "institution": Step1.institutionName,
        "owner_name": Step1.employerName.text.trim(),
        "email": Step1.emailAddress.text.trim(),
        "location": Step1.selectedLocation.text.trim(),
        "industry_nature": Step1.industryNature.text.trim(),
        "business_nature": Step1.businessNature.text.trim(),
        "previous_inspector": Step1.previousInspector.text.trim(),
        "local_male_employees": Step1.maleLocal.text.trim(),
        "local_female_employees": Step1.femaleLocal.text.trim(),
        "foreigner_male_employees": Step1.maleForeigner.text.trim(),
        "foreign_female_employees": Step1.femaleForeigner.text.trim(),
        "interviewed_person": Step1.interviewedPerson.text.trim(),
        "interviewed_people": Step1.interviewedPeople.text.trim(),
        "trade_union": Step1.tradeUnion.text.trim(),
        "other_trade_union": Step1.other.text.trim(),
        "remark": Step7.remarks.text.trim(),
      },
      "contract_of_services": {
        "permanent": {
          "compliance": Step2.compliancePermanent,
          "priority": Step2.priorityPermanent,
          "action_if_no_compliance": Step2.actionPermanent.text.trim(),
          "workers_affected": Step2.workersPermanent.text.trim(),
          "correction_deadline": Step2.permanent?.toLocal().toString().split(' ')[0],
        },
        "fixed": {
          "compliance": Step2.complianceFixed,
          "priority": Step2.priorityFixed,
          "action_if_no_compliance": Step2.actionFixed.text.trim(),
          "workers_affected": Step2.workersFixed.text.trim(),
          "correction_deadline": Step2.fixed?.toLocal().toString().split(' ')[0],
        },
        "part time": {
          "compliance": Step2.compliancePartTime,
          "priority": Step2.priorityPartTime,
          "action_if_no_compliance": Step2.actionPartTime.text.trim(),
          "workers_affected": Step2.workersPartTime.text.trim(),
          "correction_deadline": Step2.partTime?.toLocal().toString().split(' ')[0],
        },
        "dail paid": {
          "compliance": Step2.complianceDailyPaid,
          "priority": Step2.priorityDailyPaid,
          "action_if_no_compliance": Step2.actionDailyPaid.text.trim(),
          "workers_affected": Step2.workersDailyPaid.text.trim(),
          "correction_deadline": Step2.dailyPaid?.toLocal().toString().split(' ')[0],
        },
        "oral contract": {
          "compliance": Step2.complianceOralContract,
          "priority": Step2.priorityOralContract,
          "action_if_no_compliance": Step2.actionOralContract.text.trim(),
          "workers_affected": Step2.workersOralContract.text.trim(),
          "correction_deadline": Step2.oralContract?.toLocal().toString().split(' ')[0],
        },
      },
      "safety_and_health": {
        "ventilation": {
          "compliance": Step4.complianceVentilation,
          "priority": Step4.priorityVentilation,
          "action_if_no_compliance": Step4.actionVentilation.text.trim(),
          "workers_affected": Step4.workersVentilation.text.trim(),
          "correction_deadline": Step4.ventilation?.toLocal().toString().split(' ')[0],
        },
        "lighting": {
          "compliance": Step4.complianceLighting,
          "priority": Step4.priorityLighting,
          "action_if_no_compliance": Step4.actionLighting.text.trim(),
          "workers_affected": Step4.workersLighting.text.trim(),
          "correction_deadline": Step4.lighting?.toLocal().toString().split(' ')[0],
        },
        "noising": {
          "compliance": Step4.complianceNoising,
          "priority": Step4.priorityNoising,
          "action_if_no_compliance": Step4.actionNoising.text.trim(),
          "workers_affected": Step4.workersNoising.text.trim(),
          "correction_deadline": Step4.noising?.toLocal().toString().split(' ')[0],
        },
        "safety and health fire extinguisher": {
          "compliance": Step4.complianceFire,
          "priority": Step4.priorityFire,
          "action_if_no_compliance": Step4.actionFire.text.trim(),
          "workers_affected": Step4.workersFire.text.trim(),
          "correction_deadline": Step4.fire?.toLocal().toString().split(' ')[0],
        },
        "first aid kit": {
          "compliance": Step4.complianceFirstAid,
          "priority": Step4.priorityFirstAid,
          "action_if_no_compliance": Step4.actionFirstAid.text.trim(),
          "workers_affected": Step4.workersFirstAid.text.trim(),
          "correction_deadline": Step4.firstAid?.toLocal().toString().split(' ')[0],
        },
        "personal protective equipments": {
          "compliance": Step4.complianceProtectiveEquipments,
          "priority": Step4.priorityProtectiveEquipments,
          "action_if_no_compliance": Step4.actionProtectiveEquipments.text.trim(),
          "workers_affected": Step4.workersProtectiveEquipments.text.trim(),
          "correction_deadline": Step4.protectiveEquipments?.toLocal().toString().split(' ')[0],
        },
      },
      "vulnerable_group": {
        "hiv aids": {
          "compliance": Step5.complianceHIVAIDS,
          "priority": Step5.priorityHIVAIDS,
          "action_if_no_compliance": Step5.actionHIVAIDS.text.trim(),
          "workers_affected": Step5.workersHIVAIDS.text.trim(),
          "correction_deadline": Step5.HIVAIDS?.toLocal().toString().split(' ')[0],
        },
        "child labour": {
          "compliance": Step5.complianceChildLabour,
          "priority": Step5.priorityChildLabour,
          "action_if_no_compliance": Step5.actionChildLabour.text.trim(),
          "workers_affected": Step5.workersChildLabour.text.trim(),
          "correction_deadline": Step5.childLabour?.toLocal().toString().split(' ')[0],
        },
        "people with disability": {
          "compliance": Step5.complianceDisabledPeople,
          "priority": Step5.priorityDisabledPeople,
          "action_if_no_compliance": Step5.actionDisabledPeople.text.trim(),
          "workers_affected": Step5.workersDisabledPeople.text.trim(),
          "correction_deadline": Step5.disabledPeople?.toLocal().toString().split(' ')[0],
        },
      },
      "minimum_wages": {
        "local": {
          "compliance": Step6.complianceLocal,
          "priority": Step6.priorityLocal,
          "action_if_no_compliance": Step6.actionLocal.text.trim(),
          "workers_affected": Step6.workersLocal.text.trim(),
          "correction_deadline": Step6.local?.toLocal().toString().split(' ')[0],
        },
        "foreign": {
          "compliance": Step6.complianceForeigner,
          "priority": Step6.priorityForeigner,
          "action_if_no_compliance": Step6.actionForeigner.text.trim(),
          "workers_affected": Step6.workersForeigner.text.trim(),
          "correction_deadline": Step6.foreigner?.toLocal().toString().split(' ')[0],
        },
      },
      "working_hours": {
        "compliance": Step2.complianceWorkingHours,
        "priority": Step2.priorityWorkingHours,
        "action_if_no_compliance": Step2.actionWorkingHours.text.trim(),
        "workers_affected": Step2.workersWorkingHours.text.trim(),
        "correction_deadline": Step2.workingHours?.toLocal().toString().split(' ')[0],
      },
      "over_time": {
        "compliance": Step2.complianceOverTime,
        "priority": Step2.priorityOverTime,
        "action_if_no_compliance": Step2.actionOverTime.text.trim(),
        "workers_affected": Step2.workersOverTime.text.trim(),
        "correction_deadline": Step2.overTime?.toLocal().toString().split(' ')[0],
      },
      "annual_leave": {
        "compliance": Step3.complianceAnnualLeave,
        "priority": Step3.priorityAnnualLeave,
        "action_if_no_compliance": Step3.actionAnnualLeave.text.trim(),
        "workers_affected": Step3.workersAnnualLeave.text.trim(),
        "correction_deadline": Step3.annualLeave?.toLocal().toString().split(' ')[0],
      },
      "maternity_leave": {
        "compliance": Step3.complianceMaternityLeave,
        "priority": Step3.priorityMaternityLeave,
        "action_if_no_compliance": Step3.actionMaternityLeave.text.trim(),
        "workers_affected": Step3.workersMaternityLeave.text.trim(),
        "correction_deadline": Step3.maternityLeave?.toLocal().toString().split(' ')[0],
      },
      "sick_leave": {
        "compliance": Step3.complianceSickLeave,
        "priority": Step3.prioritySickLeave,
        "action_if_no_compliance": Step3.actionSickLeave.text.trim(),
        "workers_affected": Step3.workersSickLeave.text.trim(),
        "correction_deadline": Step3.sickLeave?.toLocal().toString().split(' ')[0],
      },
      "emergency_leave": {
        "compliance": Step3.complianceEmergenceLeave,
        "priority": Step3.priorityEmergenceLeave,
        "action_if_no_compliance": Step3.actionEmergenceLeave.text.trim(),
        "workers_affected": Step3.workersEmergenceLeave.text.trim(),
        "correction_deadline": Step3.emergenceLeave?.toLocal().toString().split(' ')[0],
      },
      "public_holiday": {
        "compliance": Step3.compliancePublicHoliday,
        "priority": Step3.priorityPublicHoliday,
        "action_if_no_compliance": Step3.actionPublicHoliday.text.trim(),
        "workers_affected": Step3.workersPublicHoliday.text.trim(),
        "correction_deadline": Step3.publicHoliday?.toLocal().toString().split(' ')[0],
      },
      "off_days": {
        "compliance": Step3.complianceOffDays,
        "priority": Step3.priorityOffDays,
        "action_if_no_compliance": Step3.actionOffDays.text.trim(),
        "workers_affected": Step3.workersOffDays.text.trim(),
        "correction_deadline": Step3.offDays?.toLocal().toString().split(' ')[0],
      },
      "health_examination": {
        "compliance": Step3.complianceHealthExam,
        "priority": Step3.priorityHealthExam,
        "action_if_no_compliance": Step3.actionHealthExam.text.trim(),
        "workers_affected": Step3.workersHealthExam.text.trim(),
        "correction_deadline": Step3.healthExam?.toLocal().toString().split(' ')[0],
      },
      "medical_treatment": {
        "compliance": Step4.complianceMedical,
        "priority": Step4.priorityMedical,
        "action_if_no_compliance": Step4.actionMedical.text.trim(),
        "workers_affected": Step4.workersMedical.text.trim(),
        "correction_deadline": Step4.medical?.toLocal().toString().split(' ')[0],
      },
      "workers_accommodation": {
        "compliance": Step5.complianceWorkersAccommodation,
        "priority": Step5.priorityWorkersAccommodation,
        "action_if_no_compliance": Step5.actionWorkersAccommodation.text.trim(),
        "workers_affected": Step5.workersWorkersAccommodation.text.trim(),
        "correction_deadline": Step5.workersAccommodation?.toLocal().toString().split(' ')[0],
      },
      "one_hour_break": {
        "compliance": Step5.complianceOneHourBreak,
        "priority": Step5.priorityOneHourBreak,
        "action_if_no_compliance": Step5.actionOneHourBreak.text.trim(),
        "workers_affected": Step5.workersOneHourBreak.text.trim(),
        "correction_deadline": Step5.oneHourBreak?.toLocal().toString().split(' ')[0],
      },
      "sexual_harassment": {
        "compliance": Step5.complianceSexualHarassment,
        "priority": Step5.prioritySexualHarassment,
        "action_if_no_compliance": Step5.actionSexualHarassment.text.trim(),
        "workers_affected": Step5.workersSexualHarassment.text.trim(),
        "correction_deadline": Step5.sexualHarassment?.toLocal().toString().split(' ')[0],
      },
      "night_shift": {
        "compliance": Step5.complianceNightShift,
        "priority": Step5.priorityNightShift,
        "action_if_no_compliance": Step5.actionNightShift.text.trim(),
        "workers_affected": Step5.workersNightShift.text.trim(),
        "correction_deadline": Step5.nightShift?.toLocal().toString().split(' ')[0],
      },
      "collective_bargaining": {
        "compliance": Step6.complianceCollectiveBargaining,
        "priority": Step6.priorityCollectiveBargaining,
        "action_if_no_compliance": Step6.actionCollectiveBargaining.text.trim(),
        "workers_affected": Step6.workersCollectiveBargaining.text.trim(),
        "correction_deadline": Step6.collectiveBargaining?.toLocal().toString().split(' ')[0],
      },
      "social_security": {
        "compliance": Step6.complianceSocialSecurity,
        "priority": Step6.prioritySocialSecurity,
        "action_if_no_compliance": Step6.actionSocialSecurity.text.trim(),
        "workers_affected": Step6.workersSocialSecurity.text.trim(),
        "correction_deadline": Step6.socialSecurity?.toLocal().toString().split(' ')[0],
      },
      "scheme_of_service": {
        "compliance": Step6.complianceSchemeOfService,
        "priority": Step6.prioritySchemeOfService,
        "action_if_no_compliance": Step6.actionSchemeOfService.text.trim(),
        "workers_affected": Step6.workersSchemeOfService.text.trim(),
        "correction_deadline": Step6.schemeOfService?.toLocal().toString().split(' ')[0],
      },
      "salary_increment": {
        "compliance": Step6.complianceSalaryIncrement,
        "priority": Step6.prioritySalaryIncrement,
        "action_if_no_compliance": Step6.actionSalaryIncrement.text.trim(),
        "workers_affected": Step6.workersSalaryIncrement.text.trim(),
        "correction_deadline": Step6.salaryIncrement?.toLocal().toString().split(' ')[0],
      },
      "perfomance_appraisal": {
        "compliance": Step6.compliancePerformanceAppraisal,
        "priority": Step6.priorityPerformanceAppraisal,
        "action_if_no_compliance": Step6.actionPerformanceAppraisal.text.trim(),
        "workers_affected": Step6.workersPerformanceAppraisal.text.trim(),
        "correction_deadline": Step6.performanceAppraisal?.toLocal().toString().split(' ')[0],
      },
      "succession_planning": {
        "compliance": Step6.complianceSuccessionPlanning,
        "priority": Step6.prioritySuccessionPlanning,
        "action_if_no_compliance": Step6.actionSuccessionPlanning.text.trim(),
        "workers_affected": Step6.workersSuccessionPlanning.text.trim(),
        "correction_deadline": Step6.successionPlanning?.toLocal().toString().split(' ')[0],
      },
      "labour_training": {
        "compliance": Step6.complianceLabourTraining,
        "priority": Step6.priorityLabourTraining,
        "action_if_no_compliance": Step6.actionLabourTraining.text.trim(),
        "workers_affected": Step6.workersLabourTraining.text.trim(),
        "correction_deadline": Step6.labourTraining?.toLocal().toString().split(' ')[0],
      },
    };

    String jsonPayload = jsonEncode(payload);
    print(jsonPayload);
    // Config.customFlushbar("Payload", jsonPayload, context);

    String url = Config.saveInspection;
    Dio dio = Dio();
    Options options = Options(
      responseType: ResponseType.plain,
    );
    options.contentType = 'application/x-www-form-urlencoded';

    DialogBuilder(context).showLoadingIndicator('Saving');

    try {
      Response response = await dio.post(
        url,
        data: jsonPayload,
        options: options,
      );
      debugPrint('Save local url 🙋 : $url');
      debugPrint('Save local response 🙋 : $response');
      dynamic decodedString = jsonDecode(response.toString());
      dynamic inspectorResult = decodedString['response'];
      dynamic code = inspectorResult['code'];
      String message = inspectorResult['message'];

      if (code == 200 || code == 404) {
        DialogBuilder(context).hideOpenDialog();
        // showDialog(
        //     context: context, builder: (_) => ConfirmDialog(message: "Local Inspection Saved Successfully", data: widget.splashData));

        showDialog(
            context: context, builder: (_) => ConfirmDialog(message: "Local Inspection Saved Successfully", data: widget.splashData));
      } else {
        DialogBuilder(context).hideOpenDialog();
        Config.customFlushbar("Notice", message, context);
      }
    } catch (Exception) {
      DialogBuilder(context).hideOpenDialog();
    }
  }

  void _fetchInitialData() async {
    String url = Config.appSplash;
    Dio dio = Dio();
    Options options = Options();

    try {
      Response response = await dio.post(
        url,
        data: '',
        options: options,
      );
      print("Splash response: $response");
      dynamic decodedString = jsonDecode(response.toString());
      dynamic code = decodedString['response']['code'];
      dynamic message = decodedString['response']['message'];

      if (code == 200) {
        dynamic data = decodedString['response']['data'];
        dynamic checkListTypes = data["checklists_type"];
      } else {
        Config.customFlushbar('Code $code', message, context);
      }
    } catch (e) {
      debugPrint("Unknown splash error: $e");
      Config.customFlushbar('Error', e.toString(), context);
    }
  }
}
