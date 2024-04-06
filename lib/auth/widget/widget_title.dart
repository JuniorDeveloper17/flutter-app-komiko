import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../core/theme/color.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icon/logo.png',
          height: 20,
        ),
        AutoSizeText(
          'AUTH KOMIKO APP',
          style: TextStyle(
              color: white, fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
