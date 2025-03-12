import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';

import '../helper/appcolors.dart';

class Step4 extends StatefulWidget {
  const Step4({super.key});
  // Compliance variables
  static String? complianceMedical;
  static String? complianceVentilation;
  static String? complianceLighting;
  static String? complianceNoising;
  static String? complianceFire;
  static String? complianceFirstAid;
  static String? complianceProtectiveEquipments;

  // Priority variables
  static bool priorityMedical = false;
  static bool priorityVentilation = false;
  static bool priorityLighting = false;
  static bool priorityNoising = false;
  static bool priorityFire = false;
  static bool priorityFirstAid = false;
  static bool priorityProtectiveEquipments = false;

  // Action variables
  static bool actionMedical = false;
  static bool actionVentilation = false;
  static bool actionLighting = false;
  static bool actionNoising = false;
  static bool actionFire = false;
  static bool actionFirstAid = false;
  static bool actionProtectiveEquipments = false;

  // Controllers for number worker affected fields
  static TextEditingController workersMedical = TextEditingController();
  static TextEditingController workersVentilation = TextEditingController();
  static TextEditingController workersLighting = TextEditingController();
  static TextEditingController workersNoising = TextEditingController();
  static TextEditingController workersFire = TextEditingController();
  static TextEditingController workersFirstAid = TextEditingController();
  static TextEditingController workersProtectiveEquipments = TextEditingController();

  // Controllers for deadlines fields
  static TextEditingController deadlineMedical = TextEditingController();
  static TextEditingController deadlineVentilation = TextEditingController();
  static TextEditingController deadlineLighting = TextEditingController();
  static TextEditingController deadlineNoising = TextEditingController();
  static TextEditingController deadlineFire = TextEditingController();
  static TextEditingController deadlineFirstAid = TextEditingController();
  static TextEditingController deadlineProtectiveEquipments = TextEditingController();

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
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
                '11) Medical treatments',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _medical(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '12) Safety and health',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'a) Ventilation',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _ventilation(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                'b) Lighting',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _lighting(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                'c) Noising',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _noising(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                'd) Fire extinguishers',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _fire(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                'e) First aid kit',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _firstAid(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                'f) Personal protective equipments',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _protectiveEquipments(),
            ],
          ),
        ),
      ),
    );
  }

  _medical() {
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
                            groupValue: Step4.complianceMedical,
                            onChanged: (value) {
                              setState(() {
                                Step4.complianceMedical = value;
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
                          groupValue: Step4.complianceMedical,
                          onChanged: (value) {
                            setState(() {
                              Step4.complianceMedical = value;
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
              value: Step4.priorityMedical,
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
                  Step4.priorityMedical = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step4.actionMedical,
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
                  Step4.actionMedical = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step4.workersMedical,
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
                controller: Step4.deadlineMedical,
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

  _ventilation() {
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
                            groupValue: Step4.complianceVentilation,
                            onChanged: (value) {
                              setState(() {
                                Step4.complianceVentilation = value;
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
                          groupValue: Step4.complianceVentilation,
                          onChanged: (value) {
                            setState(() {
                              Step4.complianceVentilation = value;
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
              value: Step4.priorityVentilation,
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
                  Step4.priorityVentilation = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step4.actionVentilation,
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
                  Step4.actionVentilation = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step4.workersVentilation,
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
                controller: Step4.deadlineVentilation,
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

  _lighting() {
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
                            groupValue: Step4.complianceLighting,
                            onChanged: (value) {
                              setState(() {
                                Step4.complianceLighting = value;
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
                          groupValue: Step4.complianceLighting,
                          onChanged: (value) {
                            setState(() {
                              Step4.complianceLighting = value;
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
              value: Step4.priorityLighting,
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
                  Step4.priorityLighting = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step4.actionLighting,
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
                  Step4.actionLighting = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step4.workersLighting,
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
                controller: Step4.deadlineLighting,
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

  _noising() {
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
                            groupValue: Step4.complianceNoising,
                            onChanged: (value) {
                              setState(() {
                                Step4.complianceNoising = value;
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
                          groupValue: Step4.complianceNoising,
                          onChanged: (value) {
                            setState(() {
                              Step4.complianceNoising = value;
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
              value: Step4.priorityNoising,
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
                  Step4.priorityNoising = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step4.actionNoising,
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
                  Step4.actionNoising = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step4.workersNoising,
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
                controller: Step4.deadlineNoising,
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

  _fire() {
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
                            groupValue: Step4.complianceFire,
                            onChanged: (value) {
                              setState(() {
                                Step4.complianceFire = value;
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
                          groupValue: Step4.complianceFire,
                          onChanged: (value) {
                            setState(() {
                              Step4.complianceFire = value;
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
              value: Step4.priorityFire,
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
                  Step4.priorityFire = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step4.actionFire,
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
                  Step4.actionFire = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step4.workersFire,
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
                controller: Step4.deadlineFire,
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

  _firstAid() {
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
                            groupValue: Step4.complianceFirstAid,
                            onChanged: (value) {
                              setState(() {
                                Step4.complianceFirstAid = value;
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
                          groupValue: Step4.complianceFirstAid,
                          onChanged: (value) {
                            setState(() {
                              Step4.complianceFirstAid = value;
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
              value: Step4.priorityFirstAid,
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
                  Step4.priorityFirstAid = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step4.actionFirstAid,
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
                  Step4.actionFirstAid = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step4.workersFirstAid,
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
                controller: Step4.deadlineFirstAid,
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

  _protectiveEquipments() {
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
                            groupValue: Step4.complianceProtectiveEquipments,
                            onChanged: (value) {
                              setState(() {
                                Step4.complianceProtectiveEquipments = value;
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
                          groupValue: Step4.complianceProtectiveEquipments,
                          onChanged: (value) {
                            setState(() {
                              Step4.complianceProtectiveEquipments = value;
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
              value: Step4.priorityProtectiveEquipments,
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
                  Step4.priorityProtectiveEquipments = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              value: Step4.actionProtectiveEquipments,
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
                  Step4.actionProtectiveEquipments = value ?? false;
                });
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextFormField(
                controller: Step4.workersProtectiveEquipments,
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
                controller: Step4.deadlineProtectiveEquipments,
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
