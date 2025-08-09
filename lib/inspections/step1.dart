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
  dynamic institution2 = [
    {"id": "ABBE45D6-7399-16AE-8CD9-ECC09ADAE814", "institution": "ABC KONGWE HOTEL"},
    {"id": "8EA1A199-EDFE-7D12-D382-2C98EA1B1C61", "institution": "ABC PUBLIC COMPANY"},
    {"id": "F7CCE45B-4713-6542-D818-3A35128310B8", "institution": "AI COMPANY"},
    {"id": "6B7A6CF2-2AD8-A490-80FD-B231EC3AEFB9", "institution": "CANDACE WEISS"},
    {"id": "13A3E1D8-0FB1-ED08-E866-7156A8451238", "institution": "DAWN AGUIRRE"},
    {"id": "592F2C72-EC5E-58DE-A75C-8DC534979103", "institution": "DEXTER VALDEZ"},
    {"id": "607AF5B3-28B2-EC0A-36A6-C11E0A7C76B1", "institution": "ERICH WEST"},
    {"id": "CC14D680-9F74-CA06-254D-BC916A88F020", "institution": "FULUSUSI ORGANIZATION"},
    {"id": "40BE7401-3824-122F-524D-1293349468FC", "institution": "HILDA HOLMES NGO"},
    {"id": "2B28EC47-30A4-2258-134F-BA85DC88A86D", "institution": "JAMBO OIL MANUFACTURING"},
    {"id": "E1FC14BE-0681-ECD1-DB3B-CEB04B8081DF", "institution": "JAYME PUCKETT JACKETS"},
    {"id": "DAA3B722-A721-CBE1-BEA8-ECE55A56B11F", "institution": "JOZAN VIEW LTD"},
    {"id": "A531ED3A-3C37-8C6A-05FB-5065BEB27491", "institution": "MACY MCKEE"},
    {"id": "C404DBDD-141A-516C-183C-8750290EEC67", "institution": "MOSES JOSEPH"},
    {"id": "656E819C-8E70-F879-466C-3CC7A5B6E66F", "institution": "MPARE FOOD INDUSTRY"},
    {"id": "DD0A07B7-5298-811B-DEBD-384847D8FB76", "institution": "MUSIC INSTRUMENTS COMPANY"},
    {"id": "90E115F7-1730-09E7-9488-13F03679C4AF", "institution": "NAYALY CORP"},
    {"id": "E1C11FA1-5F3B-CF58-CB75-710D333C48B9", "institution": "OCTAVIA CANTRELL"},
    {"id": "81D45AED-B168-921A-9DB6-75F505D815A7", "institution": "PAJE MAISHA CORP"},
    {"id": "CA08EB30-BBD0-482C-5B65-82F3B7D383EC", "institution": "PATIENCE JEFFERSON"},
    {"id": "0BBF95E3-BB24-4D9B-C912-3E2325016F5F", "institution": "PILAU FOUNDATION"},
    {"id": "FA06FDF5-4FAA-21FC-2E9C-49B9C4A6CA2C", "institution": "RAHISI COMPANY"},
    {"id": "04DD8C9F-C229-7AEE-F012-BD686E49A609", "institution": "RAHISI SOLUTION LTD"},
    {"id": "D8C68B3C-A813-8108-7606-482304F3F9E0", "institution": "SOFTCOM LIMITED"},
    {"id": "F1C0C81E-1821-3B90-21A7-923E9CB6B276", "institution": "SUNSHINE PRIMARY SCHOOL"},
    {"id": "1D2CDA27-3286-E80E-FA7F-21AEDEFC88F1", "institution": "TANZANITE COMPANY"},
    {"id": "7E3D7921-816A-334A-68E4-E345D61A9D81", "institution": "TOTOZI COSMETICS"},
    {"id": "8B4574FA-0990-C4F5-5C79-3E5D55EDD63F", "institution": "ttyty"},
    {"id": "51F9F540-08AD-C762-E99A-66005C5D3AFB", "institution": "VISENTE RESORT"},
    {"id": "40DA8DC9-5F4B-75EB-36A2-52616A7ADB67", "institution": "WERUWERU TOURS"},
    {"id": "57A64139-47DC-49C7-9533-595ED3831B0D", "institution": "WHILEMINA BRANCH"},
    {"id": "E8A7C014-E294-A4B8-2A5A-471017C3E828", "institution": "WOODS TRANSPORT"},
    {"id": "3D331188-1BDE-8456-0138-5F7B309493C8", "institution": "ZANZIBAR SOFTWARE"},
    {"id": "B0AF52C8-DD00-352A-C5A0-6A756C6560F9", "institution": "ZGPA"},
    {"id": "68618563-AAFC-24DE-4C35-3C3649BF72DC", "institution": "ZURA"}
  ];

  @override
  void initState() {
    institution = widget.splashData['institutions'] ?? institution2;
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
