import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';

import '../helper/appcolors.dart';
import '../widgets/slide_up.dart';

class Step5 extends StatefulWidget {
  const Step5({super.key});
  // Compliance variables
  static String? complianceWorkersAccommodation;
  static String? complianceOneHourBreak;
  static String? complianceSexualHarassment;
  static String? complianceHIVAIDS;
  static String? complianceChildLabour;
  static String? complianceDisabledPeople;
  static String? complianceNightShift;

  // Priority variables
  static String? priorityWorkersAccommodation;
  static String? priorityOneHourBreak;
  static String? prioritySexualHarassment;
  static String? priorityHIVAIDS;
  static String? priorityChildLabour;
  static String? priorityDisabledPeople;
  static String? priorityNightShift;

  // Action variables
  static TextEditingController actionWorkersAccommodation = TextEditingController();
  static TextEditingController actionOneHourBreak = TextEditingController();
  static TextEditingController actionSexualHarassment = TextEditingController();
  static TextEditingController actionHIVAIDS = TextEditingController();
  static TextEditingController actionChildLabour = TextEditingController();
  static TextEditingController actionDisabledPeople = TextEditingController();
  static TextEditingController actionNightShift = TextEditingController();

  // Controllers for number worker affected fields
  static TextEditingController workersWorkersAccommodation = TextEditingController();
  static TextEditingController workersOneHourBreak = TextEditingController();
  static TextEditingController workersSexualHarassment = TextEditingController();
  static TextEditingController workersHIVAIDS = TextEditingController();
  static TextEditingController workersChildLabour = TextEditingController();
  static TextEditingController workersDisabledPeople = TextEditingController();
  static TextEditingController workersNightShift = TextEditingController();

  // Priorities dropdown values
  static List<String> priorities = [
    'Low',
    'Medium',
    'High',
  ];

  static String? activeField;

  // deadlines of correction
  static DateTime? workersAccommodation;
  static DateTime? oneHourBreak;
  static DateTime? sexualHarassment;
  static DateTime? HIVAIDS;
  static DateTime? childLabour;
  static DateTime? disabledPeople;
  static DateTime? nightShift;

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  void _pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.light(
                onPrimary: Colors.white, // selected text color
                onSurface: AppColors.secondaryColor, // default text color
                primary: AppColors.primaryColor, // circle color
              ),
            ),
            child: child!,
          );
        });

    if (pickedDate != null) {
      setState(() {
        if (Step5.activeField == 'workersAccommodation') {
          Step5.workersAccommodation = pickedDate;
        } else if (Step5.activeField == 'oneHourBreak') {
          Step5.oneHourBreak = pickedDate;
        } else if (Step5.activeField == 'sexualHarassment') {
          Step5.sexualHarassment = pickedDate;
        } else if (Step5.activeField == 'HIVAIDS') {
          Step5.HIVAIDS = pickedDate;
        } else if (Step5.activeField == 'childLabour') {
          Step5.childLabour = pickedDate;
        } else if (Step5.activeField == 'disabledPeople') {
          Step5.disabledPeople = pickedDate;
        } else if (Step5.activeField == 'nightShift') {
          Step5.nightShift = pickedDate;
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
                '13) Workers accommodation',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _workersAndAccommodation(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '14) One hour break',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _oneHourBreak(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '15) Sexual harassment',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _sexualHarassment(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '16) Vulnerable group',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'a) HIV and AIDS',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _hivAids(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                'b) Child labour',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _childLabour(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                'c) People with disability',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _disabledPeople(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              const Divider(),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                '17) Night shift',
                style: TextStyle(
                  fontSize: SizeConfig.textMultiplier * 2,
                ),
              ),
              _nightShift(),
            ],
          ),
        ),
      ),
    );
  }

  _workersAndAccommodation() {
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
                            groupValue: Step5.complianceWorkersAccommodation,
                            activeColor: AppColors.secondaryColor,
                            onChanged: (value) {
                              setState(() {
                                Step5.complianceWorkersAccommodation = value;
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
                          groupValue: Step5.complianceWorkersAccommodation,
                          activeColor: AppColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              Step5.complianceWorkersAccommodation = value;
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
                    value: Step5.priorityWorkersAccommodation,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step5.priorityWorkersAccommodation = newValue;
                      });
                    },
                    items: Step5.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step5.complianceWorkersAccommodation == "No"
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
                          controller: Step5.actionWorkersAccommodation,
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
                controller: Step5.workersWorkersAccommodation,
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
                  Step5.activeField = 'workersAccommodation';
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
                          Step5.workersAccommodation?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _oneHourBreak() {
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
                            groupValue: Step5.complianceOneHourBreak,
                            activeColor: AppColors.secondaryColor,
                            onChanged: (value) {
                              setState(() {
                                Step5.complianceOneHourBreak = value;
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
                          groupValue: Step5.complianceOneHourBreak,
                          activeColor: AppColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              Step5.complianceOneHourBreak = value;
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
                    value: Step5.priorityOneHourBreak,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step5.priorityOneHourBreak = newValue;
                      });
                    },
                    items: Step5.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step5.complianceOneHourBreak == "No"
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
                          controller: Step5.actionOneHourBreak,
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
                controller: Step5.workersOneHourBreak,
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
                  Step5.activeField = 'oneHourBreak';
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
                          Step5.oneHourBreak?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _sexualHarassment() {
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
                            groupValue: Step5.complianceSexualHarassment,
                            activeColor: AppColors.secondaryColor,
                            onChanged: (value) {
                              setState(() {
                                Step5.complianceSexualHarassment = value;
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
                          groupValue: Step5.complianceSexualHarassment,
                          activeColor: AppColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              Step5.complianceSexualHarassment = value;
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
                    value: Step5.prioritySexualHarassment,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step5.prioritySexualHarassment = newValue;
                      });
                    },
                    items: Step5.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step5.complianceSexualHarassment == "No"
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
                          controller: Step5.actionSexualHarassment,
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
                controller: Step5.workersSexualHarassment,
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
                  Step5.activeField = 'sexualHarassment';
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
                          Step5.sexualHarassment?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _hivAids() {
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
                            groupValue: Step5.complianceHIVAIDS,
                            activeColor: AppColors.secondaryColor,
                            onChanged: (value) {
                              setState(() {
                                Step5.complianceHIVAIDS = value;
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
                          groupValue: Step5.complianceHIVAIDS,
                          activeColor: AppColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              Step5.complianceHIVAIDS = value;
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
                    value: Step5.priorityHIVAIDS,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step5.priorityHIVAIDS = newValue;
                      });
                    },
                    items: Step5.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step5.complianceHIVAIDS == "No"
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
                          controller: Step5.actionHIVAIDS,
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
                controller: Step5.workersHIVAIDS,
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
                  Step5.activeField = 'HIVAIDS';
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
                          Step5.HIVAIDS?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _childLabour() {
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
                            groupValue: Step5.complianceChildLabour,
                            activeColor: AppColors.secondaryColor,
                            onChanged: (value) {
                              setState(() {
                                Step5.complianceChildLabour = value;
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
                          groupValue: Step5.complianceChildLabour,
                          activeColor: AppColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              Step5.complianceChildLabour = value;
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
                    value: Step5.priorityChildLabour,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step5.priorityChildLabour = newValue;
                      });
                    },
                    items: Step5.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step5.complianceChildLabour == "No"
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
                          controller: Step5.actionChildLabour,
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
                controller: Step5.workersChildLabour,
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
                  Step5.activeField = 'childLabour';
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
                          Step5.childLabour?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _disabledPeople() {
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
                            groupValue: Step5.complianceDisabledPeople,
                            activeColor: AppColors.secondaryColor,
                            onChanged: (value) {
                              setState(() {
                                Step5.complianceDisabledPeople = value;
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
                          groupValue: Step5.complianceDisabledPeople,
                          activeColor: AppColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              Step5.complianceDisabledPeople = value;
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
                    value: Step5.priorityDisabledPeople,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step5.priorityDisabledPeople = newValue;
                      });
                    },
                    items: Step5.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step5.complianceDisabledPeople == "No"
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
                          controller: Step5.actionDisabledPeople,
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
                controller: Step5.workersDisabledPeople,
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
                  Step5.activeField = 'disabledPeople';
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
                          Step5.disabledPeople?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _nightShift() {
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
                            groupValue: Step5.complianceNightShift,
                            activeColor: AppColors.secondaryColor,
                            onChanged: (value) {
                              setState(() {
                                Step5.complianceNightShift = value;
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
                          groupValue: Step5.complianceNightShift,
                          activeColor: AppColors.secondaryColor,
                          onChanged: (value) {
                            setState(() {
                              Step5.complianceNightShift = value;
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
                    value: Step5.priorityNightShift,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step5.priorityNightShift = newValue;
                      });
                    },
                    items: Step5.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step5.complianceNightShift == "No"
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
                          controller: Step5.actionNightShift,
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
                controller: Step5.workersNightShift,
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
                  Step5.activeField = 'nightShift';
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
                          Step5.nightShift?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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
