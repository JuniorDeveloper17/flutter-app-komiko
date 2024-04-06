import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/color.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback ontap;
  const ButtonWidget({
    super.key,required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: Text(
        'Masuk',
        style:
            TextStyle(color: black, fontSize: 17, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: green2, fixedSize: Size(Get.width, 45)),
    );
  }
}
