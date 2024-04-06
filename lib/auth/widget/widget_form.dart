import 'package:flutter/material.dart';
import '../../core/theme/color.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController controller;
  const FormWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: white),
      decoration: InputDecoration(
          filled: true,
          fillColor: black3,
          hintText: 'Masukan kode token',
          prefixIcon: Icon(Icons.token, color: white),
          hintStyle: TextStyle(color: grey, fontSize: 15, letterSpacing: 1),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5))),
    );
  }
}
