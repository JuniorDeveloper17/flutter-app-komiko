import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:komikoproject/core/module/komik_card_5.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverList.builder(
          itemCount: favorid.komik_favorid.length,
          itemBuilder: (context, index) {
            return KomikCard5(data: favorid.komik_favorid[index]);
          }),
    );
  }
}
