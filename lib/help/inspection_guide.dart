import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';

class InspectionGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Inspection Guide',
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
              title: 'Add Foreign Employee Details',
              description:
                  'Find pending inspection record from inspection page and click start button, start by entering the foreign employees details and proceed to the next step.',
            ),
            const SizedBox(height: 20),
            _buildStep(
              stepNumber: 2,
              title: 'Add Local Employee Details',
              description:
                  'Provide the total number of local employees. Then, specify the lowest and highest salaries for the local employees. Once this is done, calculate the total number of employees (foreign + local).',
            ),
            const SizedBox(height: 20),
            _buildStep(
              stepNumber: 3,
              title: 'Description and Recommendations',
              description:
                  'In the final step, add a detailed description of your findings. Provide any recommendations or observations relevant to the inspection.',
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
            fontSize: SizeConfig.textMultiplier * 2.3,
            fontWeight: FontWeight.bold,
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
