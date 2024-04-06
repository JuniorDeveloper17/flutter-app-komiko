import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/navigation/view/navigation.dart';
import 'package:komikoproject/core/theme/color.dart';
import '../../domain/repositori/auth_data_repository.dart';

class AuthTokenController extends GetxController {
  TextEditingController tokenText = TextEditingController();

  Future masuk() async {
    final token = await AuthDataRepository().token();
    if (token == tokenText.text) {
      await AuthDataRepository().save_token(token: tokenText.text);
      Get.offAll(() => Navigation());
    } else {
      Get.snackbar('Kesalahan',
          'Token anda tidak valid, masukan token yang valid atau minta token kepada developer',
          backgroundColor: black3, colorText: white);
    }
  }
}
