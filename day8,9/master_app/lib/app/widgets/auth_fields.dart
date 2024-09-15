// ignore_for_file: prefer_typing_uninitialized_variables
// this is a widget to validate the form
import 'package:flutter/widgets.dart';
import 'my_sized_box.dart';
import 'my_text_formfield.dart';

class AuthFields extends StatefulWidget {
  final formKey;
  final RegExp regExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  AuthFields({super.key, required this.formKey});

  @override
  State<AuthFields> createState() => _AuthFieldsState();
}

class _AuthFieldsState extends State<AuthFields> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          MyTextFormfield(
              text: 'Email',
              obscureText: false,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!widget.regExp.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              }),
          mySizeBox(height: 24),
          MyTextFormfield(
              text: 'Password',
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 8) {
                  return 'password must be more than 8 characters';
                }
                return null;
              }),
        ],
      ),
    );
  }
}
