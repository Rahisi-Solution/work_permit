import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;

  void _toggle() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void validateData(String oldPassword, String newPassword, String confirmPassword) {
    print("Password validated");
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: appHeight / 1.5,
          width: appWidth / 1.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5, 0.9],
              colors: [
                Colors.white,
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'CHANGE PASSWORD',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Please enter your current password and set a new password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: appWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'EXISTING PASSWORD',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildPasswordField(
                        controller: _oldPasswordController,
                        hintText: 'Enter existing password',
                        appWidth: appWidth,
                        appHeight: appHeight,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'NEW PASSWORD',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildPasswordField(
                        controller: _newPasswordController,
                        hintText: 'Enter new password',
                        obscureText: _obscurePassword,
                        appWidth: appWidth,
                        appHeight: appHeight,
                        toggleVisibility: _toggle,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'CONFIRM NEW PASSWORD',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildPasswordField(
                        controller: _confirmPasswordController,
                        hintText: 'Re-enter new password',
                        obscureText: _obscurePassword,
                        appWidth: appWidth,
                        appHeight: appHeight,
                        toggleVisibility: _toggle,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green.shade900,
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: TextButton(
                          onPressed: () => validateData(
                            _oldPasswordController.text,
                            _newPasswordController.text,
                            _confirmPasswordController.text,
                          ),
                          child: const Text(
                            'RESET PASSWORD',
                            style: TextStyle(
                              color: Colors.white    ,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required double appWidth,
    required double appHeight,
    bool obscureText = false,
    void Function()? toggleVisibility,
  }) {
    return Container(
      height: appHeight / 14,
      width: appWidth / 1.1,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade900, width: 2.0),
        borderRadius: BorderRadius.circular(3.0),
      ),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: appHeight * 0.005),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            if (toggleVisibility != null)
              InkWell(
                onTap: toggleVisibility,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: appHeight * 0.01),
                  child: Icon(
                    obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
