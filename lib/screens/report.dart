import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reports',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReportCard(
              title: "Permit Scans",
              data: {
                "Total Permits Scanned": 123,
                "Invalid Permits Scanned": 45,
                "Valid Permits Scanned": 78,
              },
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              title: "Card Scans",
              data: {
                "Total Card Scanned": 210,
                "Invalid Card Scanned": 32,
                "Valid Card Scanned": 178,
              },
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              title: "Surveys",
              data: {
                "Total Survey": 50,
                "Approval Survey": 20,
                "Rejected Survey": 15,
                "New Survey": 15,
              },
            ),
          ],
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
                          color: Colors.grey,
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
}
