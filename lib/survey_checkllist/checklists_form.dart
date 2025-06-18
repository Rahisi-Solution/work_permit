import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wps_survey/utils/config.dart';
import 'package:wps_survey/widgets/confirm_dialog.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';
import '../models/employee_model.dart';
import '../provider/theme_provider.dart';
import '../widgets/dialog_helper.dart';

class ChecklistsForm extends StatefulWidget {
  final dynamic splashData;
  final dynamic refNumber;

  const ChecklistsForm({super.key, this.splashData, this.refNumber});
  @override
  State<ChecklistsForm> createState() => _ChecklistsFormState();
}

class _ChecklistsFormState extends State<ChecklistsForm> {
  final TextEditingController totalLocalEmployees = TextEditingController();
  final TextEditingController totalMaleLocalEmployees = TextEditingController();
  final TextEditingController totalFemaleLocalEmployees = TextEditingController();
  final TextEditingController minimumWageLocalEmployees = TextEditingController();
  final TextEditingController highestWageLocalEmployees = TextEditingController();
  final TextEditingController minimumWageForeignEmployees = TextEditingController();
  final TextEditingController highestWageForeignEmployees = TextEditingController();
  final TextEditingController recommendations = TextEditingController();
  final TextEditingController personAttendedName = TextEditingController();
  final TextEditingController personAttendedPosition = TextEditingController();
  DateTime? surveyDate;
  Future<void> _selectSurveyDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor.withOpacity(0.7),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dividerTheme: DividerThemeData(
              color: AppColors.primaryColor.withOpacity(0.1),
            ),
            dialogBackgroundColor: Colors.grey[200],
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          surveyDate = picked;
        } else {
          surveyDate = picked;
        }
      });
    }
  }

  int activeStep = 0; // Tracks the current step
  final int totalSteps = 3;
  List<EmployeeForm> employeeForms = [];
  List<Employee> employees = [];
  void addEmployeeForm() {
    setState(() {
      employeeForms.add(EmployeeForm(
        splashData: widget.splashData,
      ));
      for (var i = 0; i < employeeForms.length; i++) {
        employees.add(Employee(
          name: "",
          position: "",
          nationality: "",
          passportNumber: "",
          gender: "",
          startDate: null,
          endDate: null,
        ));
      }
    });
  }

  void deleteLastEmployeeForm() {
    setState(() {
      employeeForms.removeLast();
      employees.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Splash data at Stepper: ${widget.splashData}");
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? buttonColor;
    Color? textColor;
    Color? textColor2;
    if (themeProvider.isDarkMode) {
      textColor = Colors.white;
      textColor2 = AppColors.primaryColor;
      buttonColor = Colors.white;
    } else {
      textColor = AppColors.primaryColor;
      textColor2 = Colors.white;
      buttonColor = AppColors.primaryColor;
    }
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.primaryColor,
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
            title: Text(
              'Work Permit Inspection Report',
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
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(SizeConfig.heightMultiplier * 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: NumberStepper(
                    numbers: const [1, 2, 3],
                    lineLength: SizeConfig.widthMultiplier * 20,
                    activeStepBorderColor: Colors.transparent,
                    enableStepTapping: false,
                    activeStep: activeStep,
                    stepRadius: 15,
                    lineDotRadius: 1,
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
                ),
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
                        border: Border.all(color: buttonColor),
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
                                  color: textColor,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              )
                            : Text(
                                'Cancel',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              ),
                      ),
                    ),
                    Container(
                      width: SizeConfig.widthMultiplier * 35,
                      height: SizeConfig.heightMultiplier * 5.5,
                      decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: activeStep < totalSteps - 1 ? validation : validateBeforeSubmit,
                        child: activeStep == 2
                            ? Text(
                                'Submit',
                                style: TextStyle(
                                  color: textColor2,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              )
                            : Text(
                                'Next',
                                style: TextStyle(
                                  color: textColor2,
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
      ),
    );
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

  Widget stepsSection(int step) {
    switch (step) {
      case 0:
        return foreignEmployees();
      case 1:
        return localEmployee();
      case 2:
        return officerRecommendations();
      default:
        return const Center(
          child: Text(
            'Unknown Step',
            style: TextStyle(fontSize: 20),
          ),
        );
    }
  }

  Widget foreignEmployees() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? cardColor;
    Color? textColor;
    if (themeProvider.isDarkMode) {
      textColor = Colors.white;
    } else {
      textColor = AppColors.primaryColor;
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Foreign Employees Statistics',
              style: TextStyle(
                color: textColor,
                fontSize: SizeConfig.textMultiplier * 2,
              ),
            ),
            Stack(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: employeeForms.length,
                  itemBuilder: (context, index) {
                    return employeeForms.isEmpty ? Container() : employeeForms[index];
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: SizeConfig.widthMultiplier * 38,
                  height: SizeConfig.heightMultiplier * 5.5,
                  decoration: BoxDecoration(
                    color: const Color(0xFF037971),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF037971)),
                  ),
                  child: TextButton(
                    onPressed: addEmployeeForm,
                    child: Text(
                      'Add Employee',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                ),
                employeeForms.isEmpty
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(left: SizeConfig.heightMultiplier * 1),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 35,
                          height: SizeConfig.heightMultiplier * 5.5,
                          decoration: BoxDecoration(
                            color: Colors.red[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: deleteLastEmployeeForm,
                            child: Text(
                              'Remove',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 1.8,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  validation() {
    List<Map<String, dynamic>> foreignEmployees = [];
    bool hasErrors = false;
    if (activeStep == 0) {
      for (var i = 0; i < employeeForms.length; i++) {
        EmployeeForm form = employeeForms[i];
        Employee employee = employees[i];
        employee.name = form.employeeNameController.text.trim();
        employee.position = form.positionController.text;
        employee.nationality = form.nationality ?? '';
        employee.passportNumber = form.passportController.text;
        employee.startDate = form.startDate;
        employee.endDate = form.endDate;
        employee.gender = form.gender ?? '';
        foreignEmployees.add(employee.toMap());
        if (employee.name == "") {
          hasErrors = true;
          Config.customFlushbar("Notice", "Employee ${i + 1} name missing", context);
        } else if (employee.position == "") {
          hasErrors = true;
          Config.customFlushbar("Notice", "Employee ${i + 1} position missing", context);
        } else if (employee.nationality == "") {
          hasErrors = true;
          Config.customFlushbar("Notice", "Employee ${i + 1} nationality missing", context);
        } else if (employee.passportNumber == "") {
          hasErrors = true;
          Config.customFlushbar("Notice", "Employee ${i + 1} passport number missing", context);
        } else if (employee.startDate == null) {
          hasErrors = true;
          Config.customFlushbar("Notice", "Employee ${i + 1} start date missing", context);
        } else if (employee.endDate == null) {
          hasErrors = true;
          Config.customFlushbar("Notice", "Employee ${i + 1} end date missing", context);
        } else if (employee.gender == "") {
          hasErrors = true;
          Config.customFlushbar("Notice", "Employee ${i + 1} gender missing", context);
        }
      }
    } else if (activeStep == 1) {
      if (totalLocalEmployees.text.trim() == "") {
        hasErrors = true;
        Config.customFlushbar("Notice", "Please enter number of local employee(s)", context);
      } else if (totalMaleLocalEmployees.text.trim() == "") {
        hasErrors = true;
        Config.customFlushbar("Notice", "Please enter number of male local employee(s)", context);
      } else if (totalFemaleLocalEmployees.text.trim() == "") {
        hasErrors = true;
        Config.customFlushbar("Notice", "Please enter number of female local employee(s)", context);
      } else if (minimumWageLocalEmployees.text.trim() == "") {
        hasErrors = true;
        Config.customFlushbar("Notice", "Please enter minimum wage of local employee(s)", context);
      } else if (highestWageLocalEmployees.text.trim() == "") {
        hasErrors = true;
        Config.customFlushbar("Notice", "Please enter highest wage of local employee(s)", context);
      } else if (minimumWageForeignEmployees.text.trim() == "") {
        hasErrors = true;
        Config.customFlushbar("Notice", "Please enter minimum wage of foreign employee(s)", context);
      } else if (highestWageForeignEmployees.text.trim() == "") {
        hasErrors = true;
        Config.customFlushbar("Notice", "Please enter highest wage of foreign employee(s)", context);
      }
    }
    if (!hasErrors) {
      goToNextStep();
      print("Step 🤪 : $activeStep");
    }
  }

  validateBeforeSubmit() {
    if (recommendations.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter your recommendations", context);
    } else if (personAttendedName.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter name of the person attended", context);
    } else if (personAttendedPosition.text.trim() == "") {
      Config.customFlushbar("Notice", "Please enter position", context);
    } else if (surveyDate == null) {
      Config.customFlushbar("Notice", "Please select date", context);
    } else {
      submitData();
    }
  }

  Widget localEmployee() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Local Employees Statistics',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: SizeConfig.textMultiplier * 2,
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Total Number (Local employees)',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: totalLocalEmployees,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Total local employees',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: SizeConfig.textMultiplier * 1.8,
                        ),
                        // textAlignVertical: TextAlignVertical.center,
                        prefixIcon: const Icon(
                          CupertinoIcons.person_3,
                          color: Color(0xFF808080),
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Male local employees',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: totalMaleLocalEmployees,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Total male (Local employee)',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: SizeConfig.textMultiplier * 1.8,
                        ),
                        prefixIcon: const Icon(
                          Icons.boy_outlined,
                          color: Color(0xFF808080),
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Female local employees',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: totalFemaleLocalEmployees,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Total female (Local employee)',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: SizeConfig.textMultiplier * 1.8,
                        ),
                        prefixIcon: const Icon(
                          Icons.girl,
                          color: Color(0xFF808080),
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Minimum wage local employees',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: minimumWageLocalEmployees,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Minimum wage (Local employee)',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: SizeConfig.textMultiplier * 1.8,
                        ),
                        prefixIcon: const Icon(
                          CupertinoIcons.money_dollar,
                          color: Color(0xFF808080),
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Highest wage local employees',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: highestWageLocalEmployees,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Highest wage (Local employee)',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: SizeConfig.textMultiplier * 1.8,
                        ),
                        prefixIcon: const Icon(
                          CupertinoIcons.money_dollar_circle,
                          color: Color(0xFF808080),
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Minimum wage (Foreigner)',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: minimumWageForeignEmployees,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Minimum wage foreigner',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: SizeConfig.textMultiplier * 1.8,
                        ),
                        //
                        prefixIcon: const Icon(
                          CupertinoIcons.money_euro,
                          color: Color(0xFF808080),
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Highest wage (Foreigner)',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextFormField(
                      controller: highestWageForeignEmployees,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Highest foreigner wage',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.primaryColor.withOpacity(0.5),
                          fontSize: SizeConfig.textMultiplier * 1.8,
                        ),
                        prefixIcon: const Icon(
                          CupertinoIcons.money_euro_circle,
                          color: Color(0xFF808080),
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget officerRecommendations() {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? textColor;
    if (themeProvider.isDarkMode) {
      textColor = Colors.white;
    } else {
      textColor = AppColors.primaryColor;
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Officer Recommendations',
              style: TextStyle(
                color: textColor,
                fontSize: SizeConfig.textMultiplier * 2,
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Recommendations',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
                      child: TextFormField(
                        controller: recommendations,
                        cursorColor: AppColors.primaryColor,
                        keyboardType: TextInputType.text,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Officer recommendations',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: SizeConfig.textMultiplier * 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Name of person attended',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
                      child: TextFormField(
                        controller: personAttendedName,
                        cursorColor: AppColors.primaryColor,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Person attended name',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: SizeConfig.textMultiplier * 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Position',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 2),
                      child: TextFormField(
                        controller: personAttendedPosition,
                        cursorColor: AppColors.primaryColor,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Person attended position',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: SizeConfig.textMultiplier * 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                    child: Text(
                      'Date',
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectSurveyDate(context, true),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: AbsorbPointer(
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: surveyDate != null ? '${surveyDate!.year}/${surveyDate!.month}/${surveyDate!.day}' : 'Select date',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              size: SizeConfig.heightMultiplier * 2.5,
                              color: const Color(0xFF808080),
                            ),
                            hintStyle: TextStyle(
                              color: const Color(0xFF808080),
                              fontSize: SizeConfig.textMultiplier * 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  submitData() async {
    String url = Config.saveSurvey;
    Dio dio = Dio();
    Options options = Options();
    options.contentType = "form-data";

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? auth_token = pref.getString(Config.token);

    List<Map<String, dynamic>> foreignEmployees = [];
    for (var i = 0; i < employeeForms.length; i++) {
      EmployeeForm form = employeeForms[i];
      Employee employee = employees[i];
      employee.name = form.employeeNameController.text.trim();
      employee.position = form.positionController.text;
      employee.nationality = form.nationality ?? '';
      employee.passportNumber = form.passportController.text;
      employee.startDate = form.startDate;
      employee.endDate = form.endDate;
      employee.gender = form.gender ?? '';
      foreignEmployees.add(employee.toMap());
    }

    FormData formData = FormData.fromMap({
      "authorization": "Bearer $auth_token",
      "survey_reference": widget.refNumber,
      "foreign_employees": "$foreignEmployees",
      "number_of_local_employees": totalLocalEmployees.text.trim(),
      "male_employees": totalMaleLocalEmployees.text.trim(),
      "female_employees": totalFemaleLocalEmployees.text.trim(),
      "locals_minimum_wage": minimumWageLocalEmployees.text.trim(),
      "locals_highest_wage": highestWageLocalEmployees.text.trim(),
      "foreigners_minimum_wage": minimumWageForeignEmployees.text.trim(),
      "foreigners_highest_wage": highestWageForeignEmployees.text.trim(),
      "officer_recommendations": recommendations.text.trim(),
      "person_attended": personAttendedName.text.trim(),
      "person_position": personAttendedPosition.text.trim(),
      "survey_date": surveyDate.toString().substring(0, 10)
    });

    print("My Data: 🥵 ${formData.fields}");
    DialogBuilder(context).showLoadingIndicator('Saving');

    try {
      Response response = await dio.post(
        url,
        data: formData,
        options: options,
      );
      debugPrint('Save response: $response');
      dynamic decodedResponse = jsonDecode(response.toString());
      dynamic saveResult = decodedResponse["response"];
      dynamic code = saveResult["code"];
      dynamic message = saveResult["message"];

      debugPrint("Code: $code");

      if (code == 200) {
        DialogBuilder(context).hideOpenDialog();
        showDialog(
            context: context,
            builder: (_) => ConfirmDialog(
                  data: widget.splashData,
                  message: "Inspection Saved Successfully",
                ));
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
}

class EmployeeForm extends StatefulWidget {
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController passportController = TextEditingController();
  final dynamic splashData;
  String? nationality;
  DateTime? startDate;
  DateTime? endDate;
  String? gender;
  EmployeeForm({super.key, this.splashData});
  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final _formKey = GlobalKey<FormState>();
  List<dynamic> nationalitiesDropdownItems = [];
  List<dynamic> genderDropdownItems = [];

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor.withOpacity(0.7), // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            dividerTheme: DividerThemeData(
              color: AppColors.primaryColor.withOpacity(0.1),
            ),
            dialogBackgroundColor: Colors.grey[200], // Background color
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          widget.startDate = picked;
        } else {
          widget.endDate = picked;
        }
      });
    }
  }

  @override
  void initState() {
    setState(() {
      nationalitiesDropdownItems = widget.splashData['nationalities'];
      genderDropdownItems = widget.splashData['genders'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Name of the employee',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  controller: widget.employeeNameController,
                  cursorColor: AppColors.primaryColor,
                  textInputAction: TextInputAction.next,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'Enter employee name',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      fontSize: SizeConfig.textMultiplier * 1.8,
                    ),
                    prefixIcon: const Icon(
                      CupertinoIcons.person,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Position',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  controller: widget.positionController,
                  cursorColor: AppColors.primaryColor,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter employee position',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      fontSize: SizeConfig.textMultiplier * 1.8,
                    ),
                    prefixIcon: const Icon(
                      CupertinoIcons.square_favorites,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Nationality',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonFormField<String>(
                  value: widget.nationality,
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: 'Select nationality',
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.language,
                      color: AppColors.primaryColor,
                    ),
                    hintStyle: TextStyle(
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                  ),
                  items: nationalitiesDropdownItems.map((item) {
                    return DropdownMenuItem<String>(
                      value: item['id'],
                      child: Text(
                        item['nationality'],
                        style: TextStyle(
                          fontSize: SizeConfig.textMultiplier * 2,
                          color: const Color(0xFF808080),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      widget.nationality = newValue;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a nationality' : null,
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Passport Number',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  controller: widget.passportController,
                  cursorColor: AppColors.primaryColor,
                  textAlignVertical: TextAlignVertical.center,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Enter Passport Number',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      fontSize: SizeConfig.textMultiplier * 1.8,
                    ),
                    //
                    prefixIcon: const Icon(
                      CupertinoIcons.book,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                child: Text(
                  'Gender',
                  style: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: DropdownButtonFormField<String>(
                    value: widget.gender,
                    decoration: InputDecoration(
                      hintText: 'Select Gender',
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        CupertinoIcons.person_2,
                        color: AppColors.primaryColor,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                    items: genderDropdownItems.map((item) {
                      return DropdownMenuItem<String>(
                        value: item['id'],
                        child: Text(
                          item['name'],
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2,
                            color: const Color(0xFF808080),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.gender = newValue;
                      });
                    },
                    validator: (value) => value == null ? 'Please select a gender' : null,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                          child: Text(
                            'Start Date',
                            style: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context, true),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: AbsorbPointer(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: widget.startDate != null
                                      ? '${widget.startDate!.day}-${widget.startDate!.month}-${widget.startDate!.year}'
                                      : 'Start Date',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                    size: SizeConfig.heightMultiplier * 2.5,
                                    color: const Color(0xFF808080),
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: SizeConfig.textMultiplier * 2,
                                    color: const Color(0xFF808080),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier * 1),
                          child: Text(
                            'End Date',
                            style: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context, false),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: AbsorbPointer(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: widget.endDate != null
                                      ? '${widget.endDate!.day}-${widget.endDate!.month}-${widget.endDate!.year}'
                                      : 'End Date',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                    size: SizeConfig.heightMultiplier * 2.5,
                                    color: const Color(0xFF808080),
                                  ),
                                  hintStyle: TextStyle(
                                    fontSize: SizeConfig.textMultiplier * 2,
                                    color: const Color(0xFF808080),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
