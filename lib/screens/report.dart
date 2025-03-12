import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wps_survey/widgets/slide_up.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';
import '../utils/database_helper.dart';

class Report extends StatefulWidget {
  final dynamic totalInspections;
  final dynamic totalPendingInspections;
  final dynamic totalCompleteInspections;
  final dynamic totalRejectedInspections;
  const Report(
      {super.key, this.totalInspections, this.totalPendingInspections, this.totalCompleteInspections, this.totalRejectedInspections});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int totalValidPermits = 0;
  int totalInvalidPermits = 0;
  int totalPermits = 0;
  int totalInspections = 0;
  int totalPendingInspections = 0;
  int totalCompleteInspections = 0;
  int totalRejectedInspections = 0;

  @override
  void initState() {
    _fetchValidPermits();
    _fetchInvalidPermits();
    _fetchTotalPermits();
    totalInspections = widget.totalInspections;
    totalPendingInspections = widget.totalPendingInspections;
    totalCompleteInspections = widget.totalCompleteInspections;
    totalRejectedInspections = widget.totalRejectedInspections;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reports',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.heightMultiplier * 100,
            width: SizeConfig.widthMultiplier * 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideUp(
                  delay: 50,
                  child: _buildReportCard(
                    title: "Permit Scans",
                    data: {
                      "Total Permits Scanned": totalPermits,
                      "Invalid Permits Scanned": totalInvalidPermits,
                      "Valid Permits Scanned": totalValidPermits,
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 1),
                SlideUp(
                  delay: 100,
                  child: _buildReportCard(
                    title: "Inspections",
                    data: {
                      "Total inspections": totalInspections,
                      "Completed inspections": totalCompleteInspections,
                      "Rejected inspections": totalRejectedInspections,
                      "Pending inspections": totalPendingInspections,
                    },
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 2),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Inspection statistics',
                    style: TextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.8,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Divider(color: AppColors.primaryColor.withOpacity(0.2)),
                SlideUp(
                  delay: 150,
                  child: SizedBox(
                    height: SizeConfig.heightMultiplier * 20,
                    child: PieChart(
                      PieChartData(
                        sections: _buildPieChartSections(),
                        centerSpaceRadius: 25,
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 2,
                      ),
                    ),
                  ),
                ),
                //999241
                //DD6E42
                const SizedBox(height: 20),
                SlideUp(
                  delay: 200,
                  child: _buildLegend(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard({required String title, required Map<String, int> data}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: data.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry.key,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        entry.value.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    final total = totalPendingInspections + totalCompleteInspections + totalRejectedInspections;
    return [
      PieChartSectionData(
        color: const Color(0xffb76935),
        value: (totalPendingInspections / total) * 100,
        title: '${(((totalPendingInspections / total) * 100)).toStringAsFixed(1)} %',
        radius: 60,
        titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: const Color(0xff31572c),
        value: (totalCompleteInspections / total) * 100,
        title: '${(((totalCompleteInspections / total) * 100)).toStringAsFixed(1)} %',
        radius: 60,
        titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: const Color(0xffd90429),
        value: (totalRejectedInspections / total) * 100,
        title: '${(((totalRejectedInspections / total) * 100)).toStringAsFixed(1)} %',
        radius: 60,
        titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLegendItem(const Color(0xffb76935), 'Pending'),
        const SizedBox(width: 10),
        _buildLegendItem(const Color(0xff31572c), 'Completed'),
        const SizedBox(width: 10),
        _buildLegendItem(const Color(0xffd90429), 'Rejected'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 5),
        Text(label),
      ],
    );
  }

  Future<void> _fetchValidPermits() async {
    final dbHelper = DatabaseHelper();
    int total = await dbHelper.totalValidPermits();
    setState(() {
      totalValidPermits = total;
    });
  }

  Future<void> _fetchInvalidPermits() async {
    final dbHelper = DatabaseHelper();
    int total = await dbHelper.totalInvalidPermits();
    setState(() {
      totalInvalidPermits = total;
    });
  }

  Future<void> _fetchTotalPermits() async {
    final dbHelper = DatabaseHelper();
    int totalValid = await dbHelper.totalValidPermits();
    int totalInvalid = await dbHelper.totalInvalidPermits();
    setState(() {
      totalPermits = totalValid + totalInvalid;
    });
  }
}
