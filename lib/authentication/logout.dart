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
      materialColor = Colors.white;
    }
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: slideAnimation,
          child: Container(
            height: SizeConfig.heightMultiplier * 40,
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
                      'Confirm Logout',
                      style: TextStyle(
                        color: textColor,
                        fontSize: SizeConfig.textMultiplier * 3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // SizedBox(height: SizeConfig.heightMultiplier * 2),
                  // Container(
                  //   width: SizeConfig.widthMultiplier * 90,
                  //   height: 0.5,
                  //   color: Colors.grey[300],
                  // ),
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
                  SizedBox(height: SizeConfig.heightMultiplier * 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: SizeConfig.heightMultiplier * 5,
                        width: MediaQuery.of(context).size.width / 3.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1.4,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'NO',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: SizeConfig.heightMultiplier * 1.8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: SizeConfig.heightMultiplier * 5,
                        width: MediaQuery.of(context).size.width / 3.2,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            _logout(context);
                          },
                          child: Text(
                            'YES',
                            style: TextStyle(
                              color: const Color(0xFFf8f9fa),
                              fontSize: SizeConfig.textMultiplier * 2,
                              fontWeight: FontWeight.bold,
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
          width: SizeConfig.widthMultiplier * 15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white70,
            border: Border.all(
              color: AppColors.primaryColor,
              width: 2,
            ),
            image: const DecorationImage(
              image: AssetImage("assets/images/smz_logo.png"),
              fit: BoxFit.contain,
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
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const Login()), (route) => false);
  }
}
