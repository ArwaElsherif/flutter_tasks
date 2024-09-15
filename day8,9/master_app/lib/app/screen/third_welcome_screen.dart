import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_app/app/screen/sinup_screen.dart';
import 'package:master_app/app/screen/stateful_login_screen.dart';
import '../widgets/my_sized_box.dart';

class ThirdWelcomeScreen extends StatelessWidget {
  const ThirdWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/icons/pattern2.svg',
                    width: 472,
                    height: 472,
                  ),
                  Positioned(
                    top: 44,
                    child: Image.asset(
                      'assets/images/illustration2.png',
                      width: 375,
                      height: 416,
                    ),
                  )
                ],
              ),
              mySizeBox(height: 40),
              const Text(
                'MONSTER LIVESCORE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontFamily: 'Teko',
                  fontWeight: FontWeight.w600,
                ),
              ),
              //const SizedBox(height: 16),
              mySizeBox(height: 16),
              const SizedBox(
                width: 311,
                //padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'We’d like to check that your preferences and details are accurate.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF808797),
                    fontSize: 15,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
              //const SizedBox(height: 16),
              mySizeBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  StatefulLoginScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(311, 48),
                  backgroundColor: const Color(0xFFF8FE11),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFF141414),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              //const SizedBox(height: 16),
              mySizeBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  SinupScreen();
                  }));
                },
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(311, 48),
                  side: const BorderSide(color: Color(0xFFF8FE11)),
                ),
                child: const Text(
                  'Sign Up for Monster Livescore',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
