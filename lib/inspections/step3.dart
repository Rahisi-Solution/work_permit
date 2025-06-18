import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';

import '../helper/appcolors.dart';
import '../widgets/slide_up.dart';

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
  static String? priorityAnnualLeave;
  static String? priorityMaternityLeave;
  static String? prioritySickLeave;
  static String? priorityEmergenceLeave;
  static String? priorityPublicHoliday;
  static String? priorityOffDays;
  static String? priorityHealthExam;

  // Action variables
  static TextEditingController actionAnnualLeave = TextEditingController();
  static TextEditingController actionMaternityLeave = TextEditingController();
  static TextEditingController actionSickLeave = TextEditingController();
  static TextEditingController actionEmergenceLeave = TextEditingController();
  static TextEditingController actionPublicHoliday = TextEditingController();
  static TextEditingController actionOffDays = TextEditingController();
  static TextEditingController actionHealthExam = TextEditingController();

  // Controllers for number worker affected fields
  static TextEditingController workersAnnualLeave = TextEditingController();
  static TextEditingController workersMaternityLeave = TextEditingController();
  static TextEditingController workersSickLeave = TextEditingController();
  static TextEditingController workersEmergenceLeave = TextEditingController();
  static TextEditingController workersPublicHoliday = TextEditingController();
  static TextEditingController workersOffDays = TextEditingController();
  static TextEditingController workersHealthExam = TextEditingController();

  // Priorities dropdown values
  static List<String> priorities = [
    'Low',
    'Medium',
    'High',
  ];

  static String? activeField;

  // deadlines of correction
  static DateTime? annualLeave;
  static DateTime? maternityLeave;
  static DateTime? sickLeave;
  static DateTime? emergenceLeave;
  static DateTime? publicHoliday;
  static DateTime? offDays;
  static DateTime? healthExam;

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
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
        if (Step3.activeField == 'annualLeave') {
          Step3.annualLeave = pickedDate;
        } else if (Step3.activeField == 'maternityLeave') {
          Step3.maternityLeave = pickedDate;
        } else if (Step3.activeField == 'sickLeave') {
          Step3.sickLeave = pickedDate;
        } else if (Step3.activeField == 'emergenceLeave') {
          Step3.emergenceLeave = pickedDate;
        } else if (Step3.activeField == 'publicHoliday') {
          Step3.publicHoliday = pickedDate;
        } else if (Step3.activeField == 'offDays') {
          Step3.offDays = pickedDate;
        } else if (Step3.activeField == 'healthExam') {
          Step3.healthExam = pickedDate;
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
                            groupValue: Step3.complianceAnnualLeave,
                            activeColor: AppColors.secondaryColor,
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
                          activeColor: AppColors.secondaryColor,
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
                    value: Step3.priorityAnnualLeave,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step3.priorityAnnualLeave = newValue;
                      });
                    },
                    items: Step3.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step3.complianceAnnualLeave == "No"
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
                          controller: Step3.actionAnnualLeave,
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step3.activeField = 'annualLeave';
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
                          Step3.annualLeave?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _maternityLeave() {
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
                            groupValue: Step3.complianceMaternityLeave,
                            activeColor: AppColors.secondaryColor,
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
                          activeColor: AppColors.secondaryColor,
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
                    value: Step3.priorityMaternityLeave,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step3.priorityMaternityLeave = newValue;
                      });
                    },
                    items: Step3.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step3.complianceMaternityLeave == "No"
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
                          controller: Step3.actionMaternityLeave,
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step3.activeField = 'maternityLeave';
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
                          Step3.maternityLeave?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _sickLeave() {
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
                            groupValue: Step3.complianceSickLeave,
                            activeColor: AppColors.secondaryColor,
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
                          activeColor: AppColors.secondaryColor,
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
                    value: Step3.prioritySickLeave,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step3.prioritySickLeave = newValue;
                      });
                    },
                    items: Step3.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step3.complianceSickLeave == "No"
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
                          controller: Step3.actionSickLeave,
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step3.activeField = 'sickLeave';
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
                          Step3.sickLeave?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _emergenceLeave() {
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
                            groupValue: Step3.complianceEmergenceLeave,
                            activeColor: AppColors.secondaryColor,
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
                          activeColor: AppColors.secondaryColor,
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
                    value: Step3.priorityEmergenceLeave,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step3.priorityEmergenceLeave = newValue;
                      });
                    },
                    items: Step3.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step3.complianceEmergenceLeave == "No"
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
                          controller: Step3.actionEmergenceLeave,
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step3.activeField = 'emergenceLeave';
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
                          Step3.emergenceLeave?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _publicHoliday() {
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
                            groupValue: Step3.compliancePublicHoliday,
                            activeColor: AppColors.secondaryColor,
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
                          activeColor: AppColors.secondaryColor,
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
                    value: Step3.priorityPublicHoliday,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step3.priorityPublicHoliday = newValue;
                      });
                    },
                    items: Step3.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step3.compliancePublicHoliday == "No"
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
                          controller: Step3.actionPublicHoliday,
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step3.activeField = 'publicHoliday';
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
                          Step3.publicHoliday?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _offDays() {
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
                            groupValue: Step3.complianceOffDays,
                            activeColor: AppColors.secondaryColor,
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
                          activeColor: AppColors.secondaryColor,
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
                    value: Step3.priorityOffDays,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step3.priorityOffDays = newValue;
                      });
                    },
                    items: Step3.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step3.complianceOffDays == "No"
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
                          controller: Step3.actionOffDays,
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step3.activeField = 'offDays';
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
                          Step3.offDays?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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

  _healthExam() {
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
                            groupValue: Step3.complianceHealthExam,
                            activeColor: AppColors.secondaryColor,
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
                          activeColor: AppColors.secondaryColor,
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
                    value: Step3.priorityHealthExam,
                    onChanged: (String? newValue) {
                      setState(() {
                        Step3.priorityHealthExam = newValue;
                      });
                    },
                    items: Step3.priorities.map<DropdownMenuItem<String>>((String value) {
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
            Step3.complianceHealthExam == "No"
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
                          controller: Step3.actionHealthExam,
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
              height: SizeConfig.heightMultiplier * 5,
              width: SizeConfig.widthMultiplier * 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  Step3.activeField = 'healthExam';
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
                          Step3.healthExam?.toLocal().toString().split(' ')[0] ?? 'Deadline of correction',
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
