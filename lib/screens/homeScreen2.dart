import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wps_survey/authentication/change_password.dart';
import 'package:wps_survey/authentication/logout.dart';
import 'package:wps_survey/helper/appcolors.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/widgets/invalidDialog.dart';
import 'package:wps_survey/widgets/slide_up.dart';

import '../charts/survey_inspection_chart.dart';
import '../provider/survey_provider.dart';
import '../result/permit_result.dart';
import '../utils/config.dart';
import '../utils/database_helper.dart';
import '../widgets/dialog_helper.dart';

class Homescreen2 extends StatefulWidget {
  final dynamic splashData;
  const Homescreen2({super.key, this.splashData});

  @override
  State<Homescreen2> createState() => _Homescreen2State();
}

class _Homescreen2State extends State<Homescreen2> {
  final dbHelper = DatabaseHelper();
  String username = "";
  int totalPendingInspections = 0;
  int totalCompleteInspections = 0;
  int totalRejectedInspections = 0;
  int todayInspections = 0;
  int totalInspections = 0;
  int validPermits = 0;
  int invalidPermits = 0;
  int totalPermits = 0;
  String _scanBarcode = 'Unknown';
  String currentDate = "";
  String currentTime = "";

  @override
  void initState() {
    _prepareData();
    _fetchInspections();
    _fetchPermits();
    _getCurrentDateTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final surveyProvider = Provider.of<SurveyProvider>(context, listen: false);
    surveyProvider.syncSurveys();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.primaryColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          centerTitle: false,
          title: RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.textMultiplier * 2.3,
              ),
              children: [
                TextSpan(
                  text: username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.textMultiplier * 2.3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton(
                surfaceTintColor: Colors.green,
                child: Icon(
                  CupertinoIcons.person_crop_circle,
                  color: Colors.grey[100],
                  size: SizeConfig.widthMultiplier * 8,
                ),
                itemBuilder: (context) {
                  return List.generate(1, (index) {
                    return PopupMenuItem(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (_) => const Logout(),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: SizeConfig.textMultiplier * 2,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: SizeConfig.widthMultiplier * 4,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2.5),
                            child: Container(
                              height: 0.5,
                              width: SizeConfig.widthMultiplier * 60,
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ChangePassword(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Change PIN',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: SizeConfig.textMultiplier * 2,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: SizeConfig.widthMultiplier * 4,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: SizeConfig.widthMultiplier * 100,
          height: SizeConfig.heightMultiplier * 100,
          child: Column(
            children: [
              // _topSection(),
              _surveySummary(),
              _inspectionSummary(),
              _permitsSummary(),
              const Expanded(child: SurveyInspectionChart()),
            ],
          ),
        ),
      ),
    );
  }

  _prepareData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString(Config.username)!;
    });
  }

  _fetchInspections() async {
    todayInspections = await dbHelper.totalSurveysToday();
    totalPendingInspections = await dbHelper.totalPendingInspections();
    totalCompleteInspections = await dbHelper.totalCompleteInspections();
    totalRejectedInspections = await dbHelper.totalRejectedInspections();
    totalInspections = totalPendingInspections + totalCompleteInspections + totalRejectedInspections;
  }

  Future<void> _fetchPermits() async {
    final dbHelper = DatabaseHelper();
    int valid = await dbHelper.totalValidPermits();
    int invalid = await dbHelper.totalInvalidPermits();
    int total = valid + invalid;
    setState(() {
      validPermits = valid;
      invalidPermits = invalid;
      totalPermits = total;
    });
  }

  _topSection() {
    return Container(
      height: SizeConfig.heightMultiplier * 10,
      width: SizeConfig.widthMultiplier * 100,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello,   $username",
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.textMultiplier * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            PopupMenuButton(
              surfaceTintColor: Colors.green,
              child: Icon(
                CupertinoIcons.person_crop_circle,
                color: Colors.grey[500],
                size: SizeConfig.widthMultiplier * 8,
              ),
              itemBuilder: (context) {
                return List.generate(1, (index) {
                  return PopupMenuItem(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (_) => const Logout(),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: SizeConfig.textMultiplier * 2,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: SizeConfig.widthMultiplier * 4,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 2.5),
                          child: Container(
                            height: 0.5,
                            width: SizeConfig.widthMultiplier * 60,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ChangePassword(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Change PIN',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: SizeConfig.textMultiplier * 2,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: SizeConfig.widthMultiplier * 4,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  _surveySummary() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Inspections summary",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideUp(
                delay: 100,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF01251D),
                        const Color(0xFF095978).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.orange[900],
                            ),
                            Text(
                              totalPendingInspections.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Pending",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.7,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideUp(
                delay: 200,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF01251D),
                        const Color(0xFF095978).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                            Text(
                              totalCompleteInspections.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Completed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideUp(
                delay: 300,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF01251D),
                        const Color(0xFF095978).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.do_not_disturb_on_total_silence,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              totalRejectedInspections.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Rejected",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _permitsSummary() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Permits summary",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.textMultiplier * 2,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Container(
                width: SizeConfig.widthMultiplier * 35,
                height: SizeConfig.heightMultiplier * 5,
                decoration: BoxDecoration(
                  color: const Color(0XFF99582a),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    scanQR();
                  },
                  child: Text(
                    "Scan permit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.textMultiplier * 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideUp(
                delay: 100,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                            ),
                            Text(
                              validPermits.toString(),
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Valid scans",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.7,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideUp(
                delay: 200,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.info,
                              color: Colors.red,
                            ),
                            Text(
                              invalidPermits.toString(),
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Invalid scans",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideUp(
                delay: 300,
                child: Container(
                  width: SizeConfig.widthMultiplier * 30,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.do_not_disturb_on_total_silence,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              totalPermits.toString(),
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Total scans",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _inspectionSummary() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Inspections overview",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: SizeConfig.textMultiplier * 2,
              fontWeight: FontWeight.normal,
            ),
          ),
          Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SlideUp(
                delay: 100,
                child: Container(
                  width: SizeConfig.widthMultiplier * 47,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF01251D),
                        const Color(0xFF095978).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                            Text(
                              todayInspections.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Today",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.7,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideUp(
                delay: 200,
                child: Container(
                  width: SizeConfig.widthMultiplier * 47,
                  height: SizeConfig.heightMultiplier * 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF01251D),
                        const Color(0xFF095978).withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.add_card,
                              color: Colors.white,
                            ),
                            Text(
                              totalInspections.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.textMultiplier * 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.textMultiplier * 1.6,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
    String filteredString = _scanBarcode.replaceAll('\\', '');
    String refNumber = filteredString.replaceAll('"', '');
    DialogBuilder(context).showLoadingIndicator('Loading ...');
    print("Number ya vice now: 🙋‍ $refNumber");
    if (refNumber == "-1") {
      DialogBuilder(context).hideOpenDialog();
      Config.customFlushbar("Notice", "Missing Qr code", context);
    } else {
      _verifyPermit(refNumber);
    }
  }

  _verifyPermit(String permitNumber) async {
    String url = Config.verifyPermit;
    Dio dio = Dio();
    Options options = Options();
    options.contentType = 'application/x-www-form-urlencoded';

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(Config.token);

    // String postedData = "authorization=Bearer $token&permit_number=X9465/2425/ZP";
    String postedData = "authorization=Bearer $token&permit_number=$permitNumber";

    try {
      Response response = await dio.post(
        url,
        options: options,
        data: postedData,
      );

      debugPrint("Verify permit response🙋‍: $response");

      dynamic decodedResponse = jsonDecode(response.toString());
      dynamic decodedResult = decodedResponse["response"];
      dynamic code = decodedResult["code"];
      dynamic message = decodedResult["message"];

      if (code == 200) {
        dynamic data = decodedResult["data"];
        DialogBuilder(context).hideOpenDialog();
        _insertValidPermit(permitNumber);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PermitResult(
              splashData: widget.splashData,
              permitData: data,
            ),
          ),
        );
      } else {
        DialogBuilder(context).hideOpenDialog();
        // Config.customFlushbar("Notice", message, context);
        _insertInvalidPermit(permitNumber);
        showDialog(context: context, builder: (_) => InvalidPermitDialog(data: widget.splashData));
      }
    } catch (Exception) {
      debugPrint("Exception on certificate verification: ${Exception}");
      Config.customFlushbar("Notice", Exception.toString(), context);
    }
  }

  void _getCurrentDateTime() {
    DateTime now = DateTime.now();
    currentDate = DateFormat('dd-MM-yyyy').format(now);
    currentTime = DateFormat('HH:mm:ss').format(now);
  }

  Future<void> _insertValidPermit(String permitNumber) async {
    final dbHelper = DatabaseHelper();
    await dbHelper.insertValidPermit(permitNumber, currentDate, currentTime);
    print("Weka valid permit: ${permitNumber}");
  }

  Future<void> _insertInvalidPermit(String permitNumber) async {
    final dbHelper = DatabaseHelper();
    await dbHelper.insertInvalidPermit(permitNumber, currentDate, currentTime);
  }
}
