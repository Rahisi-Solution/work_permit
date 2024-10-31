import 'package:flutter/material.dart';

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
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: slideAnimation,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
              color: const Color(0xFFdee2e6),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Logout',
                    style: TextStyle(
                      color: Color(0xFFf07167),
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Colors.grey[400]),
                  const SizedBox(height: 30),
                  const Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(
                      color: Color(0xFF6c757d),
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Divider(color: Colors.grey[400]),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFced4da),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                              color: Color(0xFF495057),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 140),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 6,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfe6d73),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            // Add logout functionality here
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
