import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';

class PermitVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Permit verification',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
            size: SizeConfig.widthMultiplier * 7,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildStep(
              stepNumber: 1,
              title: 'Scan QR Code',
              description:
                  'Start by scanning the QR code on the certificate card using the camera. Ensure the QR code is fully visible and the lighting is adequate for a clear scan.',
            ),
            const SizedBox(height: 20),
            _buildStep(
              stepNumber: 2,
              title: 'View Employee Details',
              description:
                  'Once the QR code is scanned, the system will display the details of the employee, including their name, ID number, position, and photo.',
            ),
            const SizedBox(height: 20),
            _buildStep(
              stepNumber: 3,
              title: 'Perform Further Verification',
              description:
                  'Check the displayed details carefully and verify them with the records. If the details are accurate, proceed with the inspection or validation process.',
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
                ),
                child: Text(
                  'Got It!',
                  style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({required int stepNumber, required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step $stepNumber: $title',
          style: TextStyle(
            fontSize: SizeConfig.textMultiplier * 2.5,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
