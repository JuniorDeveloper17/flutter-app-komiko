import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchText = TextEditingController();
  RxString searchValue = ''.obs;
}
