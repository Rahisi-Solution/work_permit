import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/appcolors.dart';
import '../helper/size_config.dart';
import '../provider/theme_provider.dart';
import '../widgets/slide_up.dart';
import 'login.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> slideAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    slideAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastLinearToSlowEaseIn,
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color? materialColor;
    Color? textColor;
    Color? textColor2;
    if (themeProvider.isDarkMode) {
      textColor = Colors.white;
      textColor2 = Colors.grey[500];
      materialColor = Colors.grey[800];
    } else {
      textColor = AppColors.primaryColor;
      textColor2 = const Color(0xFF6c757d);
      materialColor = const Color(0xFFdee2e6);
    }
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: slideAnimation,
          child: Container(
            height: SizeConfig.heightMultiplier * 45,
            width: SizeConfig.widthMultiplier * 95,
            decoration: BoxDecoration(
              color: materialColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.heightMultiplier * 3),
                  _topImage(),
                  Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: textColor,
                        fontSize: SizeConfig.textMultiplier * 3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 3),
                  Center(
                    child: Text(
                      'Are you sure you want to logout?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor2,
                        fontSize: SizeConfig.textMultiplier * 2.5,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 2),
                  Divider(color: Colors.grey[400]),
                  SizedBox(height: SizeConfig.heightMultiplier * 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFced4da),
                          borderRadius: BorderRadius.circular(3.0),
                          border: Border.all(
                            color: AppColors.primaryColor.withOpacity(0.3),
                            width: 1.4,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'CANCEL',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: SizeConfig.heightMultiplier * 1.8,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfe6d73),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _logout(context);
                          },
                          child: const Text(
                            'YES',
                            style: TextStyle(
                              color: Color(0xFFf8f9fa),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _topImage() {
    return SlideUp(
      delay: 250,
      child: Center(
        child: Container(
          height: SizeConfig.heightMultiplier * 10,
          width: SizeConfig.widthMultiplier * 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white70,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 3,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.heightMultiplier * 0.1),
            child: Image.asset(
              'assets/images/smz_logo.png',
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clears all stored data. Adjust based on your needs.

    // Redirect to login screen
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => Login()), (route) => false);
  }
}
