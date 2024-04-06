import 'package:get/get.dart';
import 'package:komikoproject/app/navigation/view/navigation.dart';
import 'package:komikoproject/auth/view/auth_token.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:komikoproject/domain/repositori/auth_data_repository.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    token();
    super.onInit();
  }

  Future token() async {
    final local_token = await AuthDataRepository().local_token();
    final token = await AuthDataRepository().token();
    await favorid.get_favorid_komik();
    Future.delayed(Duration(seconds: 3), () async {
      if (token != local_token) {
        Get.offAll(AuthToken());
      } else {
        Get.offAll(Navigation());
      }
    });
  }
}
