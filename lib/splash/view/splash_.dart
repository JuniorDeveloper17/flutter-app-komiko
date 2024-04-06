import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komikoproject/core/theme/color.dart';
import 'package:komikoproject/splash/controller/splash_c.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  final splash = Get.put(SplashController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Expanded(child: SizedBox()),
            Image.asset(
              'assets/icon/logo.png',
              width: 150,
            ),
            SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: green2,
              highlightColor: white,
              child: AutoSizeText(
                'KOMIKO',
                style: GoogleFonts.fahkwang(
                    color: white, fontSize: 18, letterSpacing: 1.5),
              ),
            ),
            Expanded(child: SizedBox()),
            AutoSizeText(
              'by: JuniorDev v1.1',
              style: GoogleFonts.openSans(
                  color: grey, fontSize: 13, letterSpacing: 1),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
