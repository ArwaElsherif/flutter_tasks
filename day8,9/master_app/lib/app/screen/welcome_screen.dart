import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/my_sized_box.dart';
import 'second_welcome_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/pattern.svg',
                      width: 424,
                      height: 472,
                    ),
                    Positioned(
                      top: 174,
                      left: 122,
                      child: SvgPicture.asset(
                        'assets/icons/alien_logo.svg',
                        width: 124,
                        height: 124,
                      ),
                    ),
                  ],
                ),
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
                    'Never miss a goal - get live match alerts, fixtures and results for your favourite teams and competitions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF808797),
                      fontSize: 14,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
                //const SizedBox(height: 16),
                mySizeBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SecondWelcomeScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(311, 48),
                    backgroundColor: const Color(0xFFF8FE11),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Color(0xFF141414),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
