
import 'package:flutter/material.dart';

import '../constants/colors.dart';
class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;

  const CustomTextFormField({
    Key? key, required this.icon, required this.obscureText, required this.hintText,this.controller, this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        color: AppColors.blackColor,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(icon, color: AppColors.blackColor.withOpacity(.3),),
        hintText: hintText,
      ),
      cursorColor: AppColors.blackColor.withOpacity(.5),
    );
  }
}