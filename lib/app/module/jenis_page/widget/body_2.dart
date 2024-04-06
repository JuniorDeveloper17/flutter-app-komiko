import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/module/komik_card_3.dart';
import '../../../../domain/model/komik/komik_model_3.dart';

class BodyWidget2 extends StatelessWidget {
  final List<KomikModel3> data;
  const BodyWidget2({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 10 / 18),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return KomikCard3(
                height: Get.height.toInt(),
                width: Get.width.toInt(),
                data: data[index]);
          }),
    );
  }
}
