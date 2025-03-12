import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';

class ChangePinGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Change PIN Guide',
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
              title: 'Go to settings page',
              description: 'Locate the card labeled "Change PIN" in the app. Once you tap on it, a dialog box will appear, '
                  'guiding you through the process to update your PIN. Follow the instructions carefully to complete '
                  'the PIN change successfully.',
            ),
            const SizedBox(height: 20),
            _buildStep(
              stepNumber: 2,
              title: 'Fill out the form',
              description: 'Provide the required field which include correct old PIN which you used to login, '
                  'new PIN you wish to use now and finally confirm your new PIN for better experience.',
            ),
            const SizedBox(height: 20),
            _buildStep(
              stepNumber: 3,
              title: 'Validation and Submit',
              description: 'After completing all the required information, it is time to validate and submit. Please ensure you '
                  'remember your new PIN to avoid any complications when accessing the app. Forgetting your PIN '
                  'will require going through the PIN reset process.',
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
