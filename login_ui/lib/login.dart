// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/sign_up.dart';
import 'forget_password.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool obsecuretext = true;
  RegExp regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage('assets/images/back_ui.png'),
          width: double.infinity,
          height: double.infinity,
        ),
        Center(
          child: Container(
            width: 360,
            height: 600,
            //color: Colors.white,as
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(225, 217, 223, 204),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(195, 0, 0, 0),
                  spreadRadius: 12,
                  blurRadius: 12,
                  //offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            // ignore: prefer_const_constructors
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent, // يعني اشيل اللون للخلفية
                body: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/icons/logo_ui.png'),
                        Text(
                          'Sign in',
                          style: GoogleFonts.jomolhari(
                            fontSize: 32,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 32),
                      ],
                    ),
                    const SizedBox(height: 80),
                    SizedBox(
                      height: 62,
                      child: Form(
                        key: formstate,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your email';
                            }
                            if(!regExp.hasMatch(value)){
                              return 'please enter a valid email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            //isDense: true,
                            labelText: 'email',
                            hintText: 'arwahassan@example.com',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 62,
                      child: Form(
                        key: formkey,
                        child: TextFormField(
                          validator: (value) {
                            if(value!.isEmpty){
                              return 'please enter your password';
                            }
                            if (value.length < 8) {
                              return 'password must be more than 8 characters';
                            }
                            return null;
                          },
                          obscureText: obsecuretext,
                          decoration: InputDecoration(
                            labelText: 'password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obsecuretext = !obsecuretext;
                                });
                              },
                              icon: Icon(obsecuretext
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPassword()));
                              },
                              child: const Text(
                                'forget password',
                                style: TextStyle(fontSize: 16),
                              ))),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        if(formkey.currentState!.validate()){
                          print('valid');
                        }
                        else{
                          print('not valid');
                        }
                         if(formstate.currentState!.validate()){
                          print('valid');
                        }
                        else{
                          print('not valid');
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(160, 64),
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('create account ',),
                        InkWell(
                         onTap: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) =>
                                       const SignUp()));
                         },
                         child: const Text(
                           'sign up',
                           style: TextStyle(fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color: Colors.black),
                         )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}


////another way to add background image

// home: Scaffold(
//   appBar: AppBar(
//       title: Text('Set Background Image'),
//   ),
//   body: DecoratedBox(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/images/back_ui.png"),
//                  fit: BoxFit.cover
//            ),
//           ),
//           child: Center(
//               child: FlutterLogo(
//             size: 200,
//           )),
//         ),
// ),
