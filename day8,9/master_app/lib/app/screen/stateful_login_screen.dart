// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:master_app/app/screen/third_welcome_screen.dart';
import 'package:master_app/app/widgets/my_container.dart';
import 'package:master_app/app/widgets/my_sized_box.dart';

import '../widgets/auth_fields.dart';

class StatefulLoginScreen extends StatefulWidget {
  StatefulLoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  State<StatefulLoginScreen> createState() => _StatefulLoginScreen();
}

class _StatefulLoginScreen extends State<StatefulLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ThirdWelcomeScreen();
                        },
                      ),
                    );
                  },
                  icon: CircleAvatar(
                      backgroundColor: const Color(0XFF1F2022),
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        width: 34,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: [
                      Text(
                        'LET’S SIGN YOU IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'Teko',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Welcome back. You’ve been missed!',
                        style: TextStyle(
                          color: Color(0XFF808797),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                        ),
                      )
                    ],
                  ),
                ),
                AuthFields(
                  formKey: widget.formKey,
                ),
                mySizeBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        print('validated');	
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(311, 48),
                      backgroundColor: const Color(0xFFF8FE11),
                    ),
                    child: const Text(
                      'Login stateful',
                      style: TextStyle(
                        color: Color(0xFF141414),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                mySizeBox(height: 24),
                const Center(
                  child: Text(
                    'Or login with',
                    style: TextStyle(
                      color: Color(0XFF808797),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                mySizeBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myContainer(
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/google.svg'),
                      ),
                    ),
                    mySizeBox(height: 16),
                    myContainer(
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/twitter.svg'),
                      ),
                    ),
                    mySizeBox(height: 16),
                    myContainer(
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset('assets/icons/facebook.svg'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
