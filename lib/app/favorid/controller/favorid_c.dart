import 'package:get/get.dart';
import 'package:komikoproject/core/theme/color.dart';
import '../../../domain/model/komik/komik_model_favorid.dart';
import '../../../domain/repositori/auth_data_repository.dart';

class FavoridController extends GetxController {
  RxBool refres = false.obs;

  RxList<KomikModelFavorid> komik_favorid = <KomikModelFavorid>[].obs;

  Future save_favorid_komik({required KomikModelFavorid data}) async {
    final result = await AuthDataRepository().save_favorid(data: data);
    if (result > 0) {
      komik_favorid.add(data);
      Get.snackbar(
          'Berhasil', 'komik ${data.title} berhasil di tambahkan ke favorid',
          backgroundColor: black3, colorText: white);
    } else {
      Get.snackbar('Kesalahan', 'gagal menambahkan komik ke koleksi favorid',
          backgroundColor: black3, colorText: white);
    }
  }

  Future get_favorid_komik() async {
    final data = await AuthDataRepository().get_favorid();
    komik_favorid.value = data;
    update();
  }

  Future delete_favorid({required int id}) async {
    final data = await AuthDataRepository().delete_favorid(id: id);
    if (data == true) {
      komik_favorid.removeWhere((element) => element.id == id);
      update();
      Get.snackbar('Berhasil', 'komik berhasil dihapus dari koleksi favorid',
          backgroundColor: black3, colorText: white);
    } else {
      Get.snackbar('Kesalahan', 'komik gagal dihapus dari koleksi favorid',
          backgroundColor: black3, colorText: white);
    }
  }
}
