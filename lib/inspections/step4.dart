import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';

import '../helper/appcolors.dart';
import '../widgets/slide_up.dart';

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
  static String? priorityMedical;
  static String? priorityVentilation;
  static String? priorityLighting;
  static String? priorityNoising;
  static String? priorityFire;
  static String? priorityFirstAid;
  static String? priorityProtectiveEquipments;

  // Action variables
  static TextEditingController actionMedical = TextEditingController();
  static TextEditingController actionVentilation = TextEditingController();
  static TextEditingController actionLighting = TextEditingController();
  static TextEditingController actionNoising = TextEditingController();
  static TextEditingController actionFire = TextEditingController();
  static TextEditingController actionFirstAid = TextEditingController();
  static TextEditingController actionProtectiveEquipments = TextEditingController();

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

  // Priorities dropdown values
  static List<String> priorities = [
    'Low',
    'Medium',
    'High',
  ];

  static String? activeField;

  // deadlines of correction
  static DateTime? medical;
  static DateTime? ventilation;
  static DateTime? lighting;
  static DateTime? noising;
  static DateTime? fire;
  static DateTime? firstAid;
  static DateTime? protectiveEquipments;

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {

  void _pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        if (Step4.activeField == 'medical') {
          Step4.medical = pickedDate;
        } else if (Step4.activeField == 'ventilation') {
          Step4.ventilation = pickedDate;
        } else if (Step4.activeField == 'lighting') {
          Step4.lighting = pickedDate;
        } else if (Step4.activeField == 'noising') {
          Step4.noising = pickedDate;
        } else if (Step4.activeField == 'fire') {
          Step4.fire = pickedDate;
        } else if (Step4.activeField == 'firstAid') {
          Step4.firstAid = pickedDate;
        } else if (Step4.activeField == 'protectiveEquipments') {
          Step4.protectiveEquipments = pickedDate;
        }
      });
    }
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              'Priority',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    hint: Text(
                      "Select Priority",
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                    value: Step4.priorityMedical,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step4.priorityMedical = newValue;
                      });
                    },
                    items: Step4.priorities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Step4.complianceMedical == "No"
                ? Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                    child: SlideUp(
                      delay: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: Step4.actionMedical,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Action if no compliance',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                            prefixIcon: const Icon(
                              Icons.handyman_outlined,
                              color: Color(0xFF808080),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step4.activeField = 'medical';
                  _pickDate(context);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Color(0xFF808080),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 2),
                        Text(
                          Step4.medical?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
                          style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.7),
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              'Priority',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    hint: Text(
                      "Select Priority",
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                    value: Step4.priorityVentilation,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step4.priorityVentilation = newValue;
                      });
                    },
                    items: Step4.priorities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Step4.complianceVentilation == "No"
                ? Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                    child: SlideUp(
                      delay: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: Step4.actionVentilation,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Action if no compliance',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                            prefixIcon: const Icon(
                              Icons.handyman_outlined,
                              color: Color(0xFF808080),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step4.activeField = 'ventilation';
                  _pickDate(context);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Color(0xFF808080),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 2),
                        Text(
                          Step4.ventilation?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
                          style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.7),
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              'Priority',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    hint: Text(
                      "Select Priority",
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                    value: Step4.priorityLighting,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step4.priorityLighting = newValue;
                      });
                    },
                    items: Step4.priorities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Step4.complianceLighting == "No"
                ? Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                    child: SlideUp(
                      delay: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: Step4.actionLighting,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Action if no compliance',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                            prefixIcon: const Icon(
                              Icons.handyman_outlined,
                              color: Color(0xFF808080),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step4.activeField = 'lighting';
                  _pickDate(context);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Color(0xFF808080),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 2),
                        Text(
                          Step4.lighting?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
                          style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.7),
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              'Priority',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    hint: Text(
                      "Select Priority",
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                    value: Step4.priorityNoising,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step4.priorityNoising = newValue;
                      });
                    },
                    items: Step4.priorities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Step4.complianceNoising == "No"
                ? Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                    child: SlideUp(
                      delay: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: Step4.actionNoising,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Action if no compliance',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                            prefixIcon: const Icon(
                              Icons.handyman_outlined,
                              color: Color(0xFF808080),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step4.activeField = 'noising';
                  _pickDate(context);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Color(0xFF808080),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 2),
                        Text(
                          Step4.noising?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
                          style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.7),
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              'Priority',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    hint: Text(
                      "Select Priority",
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                    value: Step4.priorityFire,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step4.priorityFire = newValue;
                      });
                    },
                    items: Step4.priorities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Step4.complianceFire == "No"
                ? Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                    child: SlideUp(
                      delay: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: Step4.actionFire,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Action if no compliance',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                            prefixIcon: const Icon(
                              Icons.handyman_outlined,
                              color: Color(0xFF808080),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step4.activeField = 'fire';
                  _pickDate(context);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Color(0xFF808080),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 2),
                        Text(
                          Step4.fire?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
                          style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.7),
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              'Priority',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    hint: Text(
                      "Select Priority",
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                    value: Step4.priorityFirstAid,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step4.priorityFirstAid = newValue;
                      });
                    },
                    items: Step4.priorities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Step4.complianceFirstAid == "No"
                ? Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                    child: SlideUp(
                      delay: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: Step4.actionFirstAid,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Action if no compliance',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                            prefixIcon: const Icon(
                              Icons.handyman_outlined,
                              color: Color(0xFF808080),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step4.activeField = 'firstAid';
                  _pickDate(context);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Color(0xFF808080),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 2),
                        Text(
                          Step4.firstAid?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
                          style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.7),
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: SizeConfig.heightMultiplier * 1),
            Text(
              'Priority',
              style: TextStyle(
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    hint: Text(
                      "Select Priority",
                      style: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                    ),
                    value: Step4.priorityProtectiveEquipments,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step4.priorityProtectiveEquipments = newValue;
                      });
                    },
                    items: Step4.priorities.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Step4.complianceProtectiveEquipments == "No"
                ? Padding(
                    padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
                    child: SlideUp(
                      delay: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: Step4.actionProtectiveEquipments,
                          cursorColor: AppColors.primaryColor,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: 'Action if no compliance',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.primaryColor.withOpacity(0.5),
                              fontSize: SizeConfig.textMultiplier * 1.8,
                            ),
                            prefixIcon: const Icon(
                              Icons.handyman_outlined,
                              color: Color(0xFF808080),
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step4.activeField = 'protectiveEquipments';
                  _pickDate(context);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 3),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Color(0xFF808080),
                        ),
                        SizedBox(width: SizeConfig.widthMultiplier * 2),
                        Text(
                          Step4.protectiveEquipments?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
                          style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.7),
                            fontSize: SizeConfig.textMultiplier * 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
