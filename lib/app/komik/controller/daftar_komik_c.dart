import 'package:get/get.dart';

class DaftarKomikController extends GetxController {
  RxInt pageSelect = 1.obs;
  RxBool refres = false.obs;

  Future next_page() async {
    refres.value = true;
    Future.delayed(Duration(seconds: 1), () async {
      refres.value = false;
    });
  }

  RxInt jenisKomik = 0.obs;
}
