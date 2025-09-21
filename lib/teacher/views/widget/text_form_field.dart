import 'package:flutter/material.dart';

Widget buildFormField({
  String? Function(String?)? validator,
  required TextEditingController controller,TextInputType? keyboardType,
  InputDecoration? decoration = const InputDecoration()}){
  return TextFormField(
    controller: controller,
    decoration: decoration,
    keyboardType: keyboardType,
    validator: validator,

  );
}