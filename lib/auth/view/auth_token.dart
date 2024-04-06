import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:komikoproject/core/theme/color.dart';
import 'package:komikoproject/domain/repositori/auth_data_repository.dart';
import '../widget/widget_button.dart';
import '../widget/widget_form.dart';
import '../widget/widget_title.dart';

class AuthToken extends StatelessWidget {
  const AuthToken({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: Get.width - 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(),
            child: Column(
              children: [
                TitleWidget(),
                SizedBox(height: 30),
                FormWidget(
                  controller: auth.tokenText,
                ),
                SizedBox(height: 15),
                ButtonWidget(
                  ontap: () {
                    auth.masuk();
                  },
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => AuthDataRepository()
                      .send_email(messege: 'Minta Kode Token'),
                  child: AutoSizeText.rich(TextSpan(children: [
                    TextSpan(
                        text:
                            'jika kamu belum mempunyai kode token silahkan chat developer',
                        style: TextStyle(color: grey)),
                    TextSpan(
                        text: ' klik disini untuk meminta kode token',
                        style: TextStyle(
                            color: amber, fontStyle: FontStyle.italic)),
                  ])),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
