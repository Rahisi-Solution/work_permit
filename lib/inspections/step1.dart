import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';

import '../../helper/appcolors.dart';

class Step1 extends StatefulWidget {
  final dynamic splashData;
  static TextEditingController employerName = TextEditingController();
  static TextEditingController emailAddress = TextEditingController();
  static TextEditingController selectedLocation = TextEditingController();
  static TextEditingController industryNature = TextEditingController();
  static TextEditingController businessNature = TextEditingController();
  static TextEditingController previousInspector = TextEditingController();
  static TextEditingController maleLocal = TextEditingController();
  static TextEditingController femaleLocal = TextEditingController();
  static TextEditingController maleForeigner = TextEditingController();
  static TextEditingController femaleForeigner = TextEditingController();
  static TextEditingController interviewedPerson = TextEditingController();
  static TextEditingController interviewedPeople = TextEditingController();
  static TextEditingController tradeUnion = TextEditingController();
  static TextEditingController other = TextEditingController();
  static String? institutionName;
  const Step1({super.key, this.splashData});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  List<dynamic> institution = [];

  @override
  void initState() {
    institution = widget.splashData['institutions'] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: SizeConfig.widthMultiplier * 100,
        height: SizeConfig.heightMultiplier * 100,
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.widthMultiplier * 3),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'General information'.toUpperCase(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Text(
                  'Institution',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: Step1.institutionName,
                    isExpanded: true,
                    decoration: InputDecoration(
                      hintText: 'Select institution',
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.language,
                        color: AppColors.primaryColor,
                      ),
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.3),
                      ),
                    ),
                    items: institution.map((item) {
                      return DropdownMenuItem<String>(
                        value: item['id'],
                        child: Text(
                          item['institution'],
                          style: TextStyle(
                            fontSize: SizeConfig.textMultiplier * 2,
                            color: const Color(0xFF808080),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        Step1.institutionName = newValue;
                      });
                    },
                    validator: (value) => value == null ? 'Please select institution' : null,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Text(
                  'Name of employer / owner',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.employerName,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Name of employee/owner',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.person_outline,
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
                Text(
                  'Address/Email',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.emailAddress,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Address/Email',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
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
                Text(
                  'Location (Shehia, District, Region)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.selectedLocation,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Select location',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
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
                Text(
                  'Nature of industry (Hotel,School,Hospital etc)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.industryNature,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Enter industry nature',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.store_mall_directory_outlined,
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
                Text(
                  'Nature of business (Education,Telecommunication, etc)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.businessNature,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Enter business nature',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.business,
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
                Text(
                  'Previous inspector name',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.previousInspector,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Enter previous inspector',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.person_pin,
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
                Text(
                  'Male workers(Local)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.maleLocal,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Enter total male (local)',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.man_2_outlined,
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
                Text(
                  'Female workers(Local)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.femaleLocal,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Enter total female (local)',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.woman_2_outlined,
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
                Text(
                  'Male workers(Foreigner)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.maleForeigner,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Enter total male (foreigner)',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.man_2_outlined,
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
                Text(
                  'Female workers(Foreigner)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.femaleForeigner,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Enter total female (foreigner)',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.woman_2_outlined,
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
                Text(
                  'Interviewed person (Name)',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.interviewedPerson,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Enter interviewed person's name",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
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
                Text(
                  'Number of people interviewed',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.interviewedPeople,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Enter number of interviewed people",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.people,
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
                Text(
                  'Name of trade union',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.tradeUnion,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Enter name of trade union",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.bar_chart,
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
                Text(
                  'Other',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    controller: Step1.other,
                    cursorColor: AppColors.primaryColor,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: "Enter other",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.primaryColor.withOpacity(0.5),
                        fontSize: SizeConfig.textMultiplier * 1.8,
                      ),
                      prefixIcon: const Icon(
                        Icons.change_circle_outlined,
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
      ),
    );
  }
}
