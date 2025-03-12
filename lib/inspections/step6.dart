import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';

import '../../helper/appcolors.dart';

class Step6 extends StatefulWidget {
  const Step6({super.key});
  // Compliance variables
  static String? complianceLocal;
  static String? complianceForeigner;
  static String? complianceCollectiveBargaining;
  static String? complianceSocialSecurity;
  static String? complianceSchemeOfService;
  static String? complianceSalaryIncrement;
  static String? compliancePerformanceAppraisal;
  static String? complianceSuccessionPlanning;
  static String? complianceLabourTraining;

  // Priority variables
  static bool priorityLocal = false;
  static bool priorityForeigner = false;
  static bool priorityCollectiveBargaining = false;
  static bool prioritySocialSecurity = false;
  static bool prioritySchemeOfService = false;
  static bool prioritySalaryIncrement = false;
  static bool priorityPerformanceAppraisal = false;
  static bool prioritySuccessionPlanning = false;
  static bool priorityLabourTraining = false;

  // Action variables
  static bool actionLocal = false;
  static bool actionForeigner = false;
  static bool actionCollectiveBargaining = false;
  static bool actionSocialSecurity = false;
  static bool actionSchemeOfService = false;
  static bool actionSalaryIncrement = false;
  static bool actionPerformanceAppraisal = false;
  static bool actionSuccessionPlanning = false;
  static bool actionLabourTraining = false;

  // Controllers for number worker affected fields
  static TextEditingController workersLocal = TextEditingController();
  static TextEditingController workersForeigner = TextEditingController();
  static TextEditingController workersCollectiveBargaining = TextEditingController();
  static TextEditingController workersSocialSecurity = TextEditingController();
  static TextEditingController workersSchemeOfService = TextEditingController();
  static TextEditingController workersSalaryIncrement = TextEditingController();
  static TextEditingController workersPerformanceAppraisal = TextEditingController();
  static TextEditingController workersSuccessionPlanning = TextEditingController();
  static TextEditingController workersLabourTraining = TextEditingController();

  // Controllers for deadlines fields
  static TextEditingController deadlineLocal = TextEditingController();
  static TextEditingController deadlineForeigner = TextEditingController();
  static TextEditingController deadlineCollectiveBargaining = TextEditingController();
  static TextEditingController deadlineSocialSecurity = TextEditingController();
  static TextEditingController deadlineSchemeOfService = TextEditingController();
  static TextEditingController deadlineSalaryIncrement = TextEditingController();
  static TextEditingController deadlinePerformanceAppraisal = TextEditingController();
  static TextEditingController deadlineSuccessionPlanning = TextEditingController();
  static TextEditingController deadlineLabourTraining = TextEditingController();

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return SizedBox(
      width: SizeConfig.widthMultiplier * 100,
      height: SizeConfig.heightMultiplier * 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '18) Minimum Wages',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'a) Local',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _local(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                'b) Foreign',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _foreigner(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '19) Collective bargaining',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _collectiveBargaining(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '20) Social security',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _socialSecurity(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '21) Scheme of service',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _schemeOfService(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '22) Salary increment',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _salaryIncrement(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '23) Performance appraisal',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _performanceAppraisal(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '24) Succession planning',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _successionPlanning(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '25) Labour training',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _labourTraining(),
            ],
          ),
        ),
      ),
    );
  }

  _local() {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compliance',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                          minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                          minTileHeight: SizeConfig.heightMultiplier * 0.01,
                          minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: Step6.complianceLocal,
                            onChanged: (value) {
                              setState(() {
                                Step6.complianceLocal = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 10),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                        minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                        minTileHeight: SizeConfig.heightMultiplier * 0.01,
                        minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: Step6.complianceLocal,
                          onChanged: (value) {
                            setState(() {
                              Step6.complianceLocal = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(
              value: Step6.priorityLocal,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              title: Text(
                'Priority',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.priorityLocal = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step6.actionLocal,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Action if no compliance',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.actionLocal = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.workersLocal,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'No. of workers affected',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.work_outline_sharp,
                    color: Color(0xFF808080),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.deadlineLocal,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Deadline of correction',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.date_range,
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
    );
  }

  _foreigner() {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compliance',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                          minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                          minTileHeight: SizeConfig.heightMultiplier * 0.01,
                          minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: Step6.complianceForeigner,
                            onChanged: (value) {
                              setState(() {
                                Step6.complianceForeigner = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 10),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                        minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                        minTileHeight: SizeConfig.heightMultiplier * 0.01,
                        minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: Step6.complianceForeigner,
                          onChanged: (value) {
                            setState(() {
                              Step6.complianceForeigner = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(
              value: Step6.priorityForeigner,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              title: Text(
                'Priority',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.priorityForeigner = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step6.actionForeigner,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Action if no compliance',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.actionForeigner = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.workersForeigner,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'No. of workers affected',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.work_outline_sharp,
                    color: Color(0xFF808080),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.deadlineForeigner,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Deadline of correction',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.date_range,
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
    );
  }

  _collectiveBargaining() {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compliance',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                          minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                          minTileHeight: SizeConfig.heightMultiplier * 0.01,
                          minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: Step6.complianceCollectiveBargaining,
                            onChanged: (value) {
                              setState(() {
                                Step6.complianceCollectiveBargaining = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 10),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                        minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                        minTileHeight: SizeConfig.heightMultiplier * 0.01,
                        minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: Step6.complianceCollectiveBargaining,
                          onChanged: (value) {
                            setState(() {
                              Step6.complianceCollectiveBargaining = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(
              value: Step6.priorityCollectiveBargaining,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              title: Text(
                'Priority',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.priorityCollectiveBargaining = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step6.actionCollectiveBargaining,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Action if no compliance',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.actionCollectiveBargaining = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.workersCollectiveBargaining,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'No. of workers affected',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.work_outline_sharp,
                    color: Color(0xFF808080),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.deadlineCollectiveBargaining,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Deadline of correction',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.date_range,
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
    );
  }

  _socialSecurity() {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compliance',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                          minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                          minTileHeight: SizeConfig.heightMultiplier * 0.01,
                          minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: Step6.complianceSocialSecurity,
                            onChanged: (value) {
                              setState(() {
                                Step6.complianceSocialSecurity = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 10),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                        minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                        minTileHeight: SizeConfig.heightMultiplier * 0.01,
                        minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: Step6.complianceSocialSecurity,
                          onChanged: (value) {
                            setState(() {
                              Step6.complianceSocialSecurity = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(
              value: Step6.prioritySocialSecurity,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              title: Text(
                'Priority',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.prioritySocialSecurity = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step6.actionSocialSecurity,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Action if no compliance',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.actionSocialSecurity = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.workersSocialSecurity,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'No. of workers affected',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.work_outline_sharp,
                    color: Color(0xFF808080),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.deadlineSocialSecurity,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Deadline of correction',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.date_range,
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
    );
  }

  _schemeOfService() {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compliance',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                          minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                          minTileHeight: SizeConfig.heightMultiplier * 0.01,
                          minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: Step6.complianceSchemeOfService,
                            onChanged: (value) {
                              setState(() {
                                Step6.complianceSchemeOfService = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 10),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                        minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                        minTileHeight: SizeConfig.heightMultiplier * 0.01,
                        minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: Step6.complianceSchemeOfService,
                          onChanged: (value) {
                            setState(() {
                              Step6.complianceSchemeOfService = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(
              value: Step6.prioritySchemeOfService,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              title: Text(
                'Priority',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.prioritySchemeOfService = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step6.actionSchemeOfService,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Action if no compliance',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.actionSchemeOfService = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.workersSchemeOfService,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'No. of workers affected',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.work_outline_sharp,
                    color: Color(0xFF808080),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.deadlineSchemeOfService,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Deadline of correction',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.date_range,
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
    );
  }

  _salaryIncrement() {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compliance',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                          minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                          minTileHeight: SizeConfig.heightMultiplier * 0.01,
                          minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: Step6.complianceSalaryIncrement,
                            onChanged: (value) {
                              setState(() {
                                Step6.complianceSalaryIncrement = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 10),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                        minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                        minTileHeight: SizeConfig.heightMultiplier * 0.01,
                        minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: Step6.complianceSalaryIncrement,
                          onChanged: (value) {
                            setState(() {
                              Step6.complianceSalaryIncrement = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(
              value: Step6.prioritySalaryIncrement,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              title: Text(
                'Priority',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.prioritySalaryIncrement = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step6.actionSalaryIncrement,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Action if no compliance',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.actionSalaryIncrement = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.workersSalaryIncrement,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'No. of workers affected',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.work_outline_sharp,
                    color: Color(0xFF808080),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.deadlineSalaryIncrement,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Deadline of correction',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.date_range,
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
    );
  }

  _performanceAppraisal() {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compliance',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                          minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                          minTileHeight: SizeConfig.heightMultiplier * 0.01,
                          minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: Step6.compliancePerformanceAppraisal,
                            onChanged: (value) {
                              setState(() {
                                Step6.compliancePerformanceAppraisal = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 10),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                        minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                        minTileHeight: SizeConfig.heightMultiplier * 0.01,
                        minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: Step6.compliancePerformanceAppraisal,
                          onChanged: (value) {
                            setState(() {
                              Step6.compliancePerformanceAppraisal = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(
              value: Step6.priorityPerformanceAppraisal,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              title: Text(
                'Priority',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.priorityPerformanceAppraisal = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step6.actionPerformanceAppraisal,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Action if no compliance',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.actionPerformanceAppraisal = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.workersPerformanceAppraisal,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'No. of workers affected',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.work_outline_sharp,
                    color: Color(0xFF808080),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.deadlinePerformanceAppraisal,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Deadline of correction',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.date_range,
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
    );
  }

  _successionPlanning() {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compliance',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                          minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                          minTileHeight: SizeConfig.heightMultiplier * 0.01,
                          minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: Step6.complianceSuccessionPlanning,
                            onChanged: (value) {
                              setState(() {
                                Step6.complianceSuccessionPlanning = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 10),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                        minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                        minTileHeight: SizeConfig.heightMultiplier * 0.01,
                        minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: Step6.complianceSuccessionPlanning,
                          onChanged: (value) {
                            setState(() {
                              Step6.complianceSuccessionPlanning = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(
              value: Step6.prioritySuccessionPlanning,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              title: Text(
                'Priority',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.prioritySuccessionPlanning = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step6.actionSuccessionPlanning,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Action if no compliance',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.actionSuccessionPlanning = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.workersSuccessionPlanning,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'No. of workers affected',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.work_outline_sharp,
                    color: Color(0xFF808080),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.deadlineSuccessionPlanning,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Deadline of correction',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.date_range,
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
    );
  }

  _labourTraining() {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.widthMultiplier * 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Compliance',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 2,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: SizeConfig.textMultiplier * 1.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                          minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                          minTileHeight: SizeConfig.heightMultiplier * 0.01,
                          minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                          contentPadding: EdgeInsets.zero,
                          leading: Radio<String>(
                            value: 'Yes',
                            groupValue: Step6.complianceLabourTraining,
                            onChanged: (value) {
                              setState(() {
                                Step6.complianceLabourTraining = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.widthMultiplier * 10),
                    SizedBox(
                      width: SizeConfig.widthMultiplier * 20,
                      child: ListTile(
                        title: Text(
                          'No',
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 1.8,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        horizontalTitleGap: SizeConfig.widthMultiplier * 0.01,
                        minLeadingWidth: SizeConfig.widthMultiplier * 0.01,
                        minTileHeight: SizeConfig.heightMultiplier * 0.01,
                        minVerticalPadding: SizeConfig.heightMultiplier * 0.01,
                        contentPadding: EdgeInsets.zero,
                        leading: Radio<String>(
                          value: 'No',
                          groupValue: Step6.complianceLabourTraining,
                          onChanged: (value) {
                            setState(() {
                              Step6.complianceLabourTraining = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(
              value: Step6.priorityLabourTraining,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              title: Text(
                'Priority',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.priorityLabourTraining = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step6.actionLabourTraining,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Action if no compliance',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  Step6.actionLabourTraining = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.workersLabourTraining,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'No. of workers affected',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.work_outline_sharp,
                    color: Color(0xFF808080),
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step6.deadlineLabourTraining,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Deadline of correction',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: AppColors.primaryColor.withOpacity(0.5),
                    fontSize: SizeConfig.textMultiplier * 1.8,
                  ),
                  prefixIcon: const Icon(
                    Icons.date_range,
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
    );
  }
}
