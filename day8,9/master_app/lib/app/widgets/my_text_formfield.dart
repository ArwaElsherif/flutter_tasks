// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_app/app/screen/password_cubit.dart';

class MyTextFormfield extends StatelessWidget {
  final String text;
  final TextInputType textInputType;
  bool obscureText = false;
  final String? Function(String?) validator;
  MyTextFormfield({
    super.key,
    required this.text,
    required this.textInputType,
    required this.obscureText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordCubit(), // Provide the cubit
      child: BlocBuilder<PasswordCubit, bool>(builder: (context, isHidden) {
        return TextFormField(
          cursorColor: const Color(0xFFF8FE11),
          keyboardType: textInputType,
          obscureText: isHidden,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: textInputType == TextInputType.visiblePassword
            ?IconButton(
              icon: Icon(

                isHidden ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () =>
                  context.read<PasswordCubit>().togglePasswordVisibility(),
            )
            : null,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF8FE11))),
            label: Text(
              text,
              style: const TextStyle(
                color: Color(0XFF808797),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.5,
              ),
            ),
          ),
          validator: validator,
        );
      }),
    );
  }
}
