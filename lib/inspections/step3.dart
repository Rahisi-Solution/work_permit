import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';

import '../helper/appcolors.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});
  // Compliance variables
  static String? complianceAnnualLeave;
  static String? complianceMaternityLeave;
  static String? complianceSickLeave;
  static String? complianceEmergenceLeave;
  static String? compliancePublicHoliday;
  static String? complianceOffDays;
  static String? complianceHealthExam;

  // Priority variables
  static bool priorityAnnualLeave = false;
  static bool priorityMaternityLeave = false;
  static bool prioritySickLeave = false;
  static bool priorityEmergenceLeave = false;
  static bool priorityPublicHoliday = false;
  static bool priorityOffDays = false;
  static bool priorityHealthExam = false;

  // Action variables
  static bool actionAnnualLeave = false;
  static bool actionMaternityLeave = false;
  static bool actionSickLeave = false;
  static bool actionEmergenceLeave = false;
  static bool actionPublicHoliday = false;
  static bool actionOffDays = false;
  static bool actionHealthExam = false;

  // Controllers for number worker affected fields
  static TextEditingController workersAnnualLeave = TextEditingController();
  static TextEditingController workersMaternityLeave = TextEditingController();
  static TextEditingController workersSickLeave = TextEditingController();
  static TextEditingController workersEmergenceLeave = TextEditingController();
  static TextEditingController workersPublicHoliday = TextEditingController();
  static TextEditingController workersOffDays = TextEditingController();
  static TextEditingController workersHealthExam = TextEditingController();

  // Controllers for deadlines fields
  static TextEditingController deadlineAnnualLeave = TextEditingController();
  static TextEditingController deadlineMaternityLeave = TextEditingController();
  static TextEditingController deadlineSickLeave = TextEditingController();
  static TextEditingController deadlineEmergenceLeave = TextEditingController();
  static TextEditingController deadlinePublicHoliday = TextEditingController();
  static TextEditingController deadlineOffDays = TextEditingController();
  static TextEditingController deadlineHealthExam = TextEditingController();

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
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
                '4) Annual leave',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _annualLeave(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '5) Maternity leave',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _maternityLeave(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '6) Sick leave',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _sickLeave(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '7) Temporary emergence leave',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _emergenceLeave(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '8) Public holiday',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _publicHoliday(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '9) Off days',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _offDays(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '10) Health examination',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _healthExam(),
            ],
          ),
        ),
      ),
    );
  }

  _annualLeave() {
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
                            groupValue: Step3.complianceAnnualLeave,
                            onChanged: (value) {
                              setState(() {
                                Step3.complianceAnnualLeave = value;
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
                          groupValue: Step3.complianceAnnualLeave,
                          onChanged: (value) {
                            setState(() {
                              Step3.complianceAnnualLeave = value;
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
              value: Step3.priorityAnnualLeave,
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
                  Step3.priorityAnnualLeave = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step3.actionAnnualLeave,
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
                  Step3.actionAnnualLeave = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step3.workersAnnualLeave,
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
                controller: Step3.deadlineAnnualLeave,
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

  _maternityLeave() {
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
                            groupValue: Step3.complianceMaternityLeave,
                            onChanged: (value) {
                              setState(() {
                                Step3.complianceMaternityLeave = value;
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
                          groupValue: Step3.complianceMaternityLeave,
                          onChanged: (value) {
                            setState(() {
                              Step3.complianceMaternityLeave = value;
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
              value: Step3.priorityMaternityLeave,
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
                  Step3.priorityMaternityLeave = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step3.actionMaternityLeave,
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
                  Step3.actionMaternityLeave = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step3.workersMaternityLeave,
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
                controller: Step3.deadlineMaternityLeave,
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

  _sickLeave() {
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
                            groupValue: Step3.complianceSickLeave,
                            onChanged: (value) {
                              setState(() {
                                Step3.complianceSickLeave = value;
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
                          groupValue: Step3.complianceSickLeave,
                          onChanged: (value) {
                            setState(() {
                              Step3.complianceSickLeave = value;
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
              value: Step3.prioritySickLeave,
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
                  Step3.prioritySickLeave = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step3.actionSickLeave,
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
                  Step3.actionSickLeave = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step3.workersSickLeave,
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
                controller: Step3.deadlineSickLeave,
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

  _emergenceLeave() {
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
                            groupValue: Step3.complianceEmergenceLeave,
                            onChanged: (value) {
                              setState(() {
                                Step3.complianceEmergenceLeave = value;
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
                          groupValue: Step3.complianceEmergenceLeave,
                          onChanged: (value) {
                            setState(() {
                              Step3.complianceEmergenceLeave = value;
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
              value: Step3.priorityEmergenceLeave,
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
                  Step3.priorityEmergenceLeave = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step3.actionEmergenceLeave,
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
                  Step3.actionEmergenceLeave = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step3.workersEmergenceLeave,
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
                controller: Step3.deadlineEmergenceLeave,
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

  _publicHoliday() {
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
                            groupValue: Step3.compliancePublicHoliday,
                            onChanged: (value) {
                              setState(() {
                                Step3.compliancePublicHoliday = value;
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
                          groupValue: Step3.compliancePublicHoliday,
                          onChanged: (value) {
                            setState(() {
                              Step3.compliancePublicHoliday = value;
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
              value: Step3.priorityPublicHoliday,
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
                  Step3.priorityPublicHoliday = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step3.actionPublicHoliday,
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
                  Step3.actionPublicHoliday = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step3.workersPublicHoliday,
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
                controller: Step3.deadlinePublicHoliday,
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

  _offDays() {
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
                            groupValue: Step3.complianceOffDays,
                            onChanged: (value) {
                              setState(() {
                                Step3.complianceOffDays = value;
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
                          groupValue: Step3.complianceOffDays,
                          onChanged: (value) {
                            setState(() {
                              Step3.complianceOffDays = value;
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
              value: Step3.priorityOffDays,
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
                  Step3.priorityOffDays = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step3.actionOffDays,
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
                  Step3.actionOffDays = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step3.workersOffDays,
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
                controller: Step3.deadlineOffDays,
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

  _healthExam() {
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
                            groupValue: Step3.complianceHealthExam,
                            onChanged: (value) {
                              setState(() {
                                Step3.complianceHealthExam = value;
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
                          groupValue: Step3.complianceHealthExam,
                          onChanged: (value) {
                            setState(() {
                              Step3.complianceHealthExam = value;
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
              value: Step3.priorityHealthExam,
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
                  Step3.priorityHealthExam = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step3.actionHealthExam,
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
                  Step3.actionHealthExam = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step3.workersHealthExam,
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
                controller: Step3.deadlineHealthExam,
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
