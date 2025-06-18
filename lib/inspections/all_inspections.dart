import 'package:flutter/material.dart';
import 'package:wps_survey/helper/size_config.dart';
import 'package:wps_survey/inspections/inspection_form.dart';
import 'package:wps_survey/widgets/slide_up.dart';

import '../helper/appcolors.dart';

class AllInspections extends StatefulWidget {
  final dynamic splashData;
  const AllInspections({super.key, this.splashData});

  @override
  State<AllInspections> createState() => _AllInspectionsState();
}

class _AllInspectionsState extends State<AllInspections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Surveys",
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: SizeConfig.widthMultiplier * 100,
          height: SizeConfig.heightMultiplier * 100,
          child: Column(
            children: [
              _startButton(),
              Expanded(
                child: _body(),
              )
            ],
          ),
        ),
      ),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SlideUp(
              delay: 200,
              child: Container(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 1,
                          height: SizeConfig.heightMultiplier * 18,
                          decoration: const BoxDecoration(color: AppColors.primaryColor),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 70,
                              child: Text(
                                'Mtimkavu Computing Solution Corporation Ltd'.toUpperCase(),
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'REFERENCE : '.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' SUT5893933'.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColors.secondaryColor,
                              thickness: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.primaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '2025-03-25'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.secondaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '13:43:00'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.secondaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            SlideUp(
              delay: 200,
              child: Container(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 1,
                          height: SizeConfig.heightMultiplier * 18,
                          decoration: const BoxDecoration(color: AppColors.primaryColor),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 70,
                              child: Text(
                                'Mtimkavu Computing Solution Corporation Ltd'.toUpperCase(),
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'REFERENCE : '.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' SUT5893933'.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColors.secondaryColor,
                              thickness: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.primaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '2025-03-25'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.secondaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '13:43:00'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.secondaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            SlideUp(
              delay: 200,
              child: Container(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 1,
                          height: SizeConfig.heightMultiplier * 18,
                          decoration: const BoxDecoration(color: AppColors.primaryColor),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 70,
                              child: Text(
                                'Mtimkavu Computing Solution Corporation Ltd'.toUpperCase(),
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'REFERENCE : '.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' SUT5893933'.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColors.secondaryColor,
                              thickness: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.primaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '2025-03-25'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.secondaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '13:43:00'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.secondaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            SlideUp(
              delay: 200,
              child: Container(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 1,
                          height: SizeConfig.heightMultiplier * 18,
                          decoration: const BoxDecoration(color: AppColors.primaryColor),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 70,
                              child: Text(
                                'Mtimkavu Computing Solution Corporation Ltd'.toUpperCase(),
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'REFERENCE : '.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' SUT5893933'.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColors.secondaryColor,
                              thickness: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.primaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '2025-03-25'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.secondaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '13:43:00'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.secondaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            SlideUp(
              delay: 200,
              child: Container(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 1,
                          height: SizeConfig.heightMultiplier * 18,
                          decoration: const BoxDecoration(color: AppColors.primaryColor),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 70,
                              child: Text(
                                'Mtimkavu Computing Solution Corporation Ltd'.toUpperCase(),
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'REFERENCE : '.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' SUT5893933'.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColors.secondaryColor,
                              thickness: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.primaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '2025-03-25'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.secondaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '13:43:00'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.secondaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            SlideUp(
              delay: 200,
              child: Container(
                width: SizeConfig.widthMultiplier * 100,
                height: SizeConfig.heightMultiplier * 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 0), // Shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: SizeConfig.widthMultiplier * 1,
                          height: SizeConfig.heightMultiplier * 18,
                          decoration: const BoxDecoration(color: AppColors.primaryColor),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 70,
                              child: Text(
                                'Mtimkavu Computing Solution Corporation Ltd'.toUpperCase(),
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: SizeConfig.textMultiplier * 1.8,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'REFERENCE : '.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' SUT5893933'.toUpperCase(),
                                  style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: SizeConfig.textMultiplier * 1.8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: AppColors.secondaryColor,
                              thickness: 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.date_range_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.primaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '2025-03-25'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.secondaryColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          size: SizeConfig.widthMultiplier * 5,
                                          color: AppColors.secondaryColor.withOpacity(0.8),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '13:43:00'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.secondaryColor,
                                            fontSize: SizeConfig.textMultiplier * 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _startButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.widthMultiplier * 55,
            height: SizeConfig.heightMultiplier * 5,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => InspectionForm(
                    splashData: widget.splashData,
                  ),
                ),
              );
            },
            child: Container(
              width: SizeConfig.widthMultiplier * 40,
              height: SizeConfig.heightMultiplier * 5,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'New Survey',
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
    );
  }
}
