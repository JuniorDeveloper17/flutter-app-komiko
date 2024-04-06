import 'package:get/get.dart';
import 'package:komikoproject/app/favorid/controller/favorid_c.dart';
import 'package:komikoproject/app/home/controller/home_c.dart';
import 'package:komikoproject/app/komik/controller/daftar_komik_c.dart';
import 'package:komikoproject/app/module/jenis_page/controller/jenis_c.dart';
import 'package:komikoproject/app/navigation/controller/nav.dart';
import 'package:komikoproject/app/setting/controller/setting_c.dart';
import 'package:komikoproject/auth/controller/auth_token_c.dart';

final nav = Get.put(NavigationController());
final home = Get.put(HomeController());

final genre_p = Get.put(GenrePageController());
final daftar_k = Get.put(DaftarKomikController());
final auth = Get.put(AuthTokenController());

final setting = Get.put(SettingController());
final favorid = Get.put(FavoridController(), permanent: true);
