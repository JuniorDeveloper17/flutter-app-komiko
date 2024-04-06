import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/core/module/komik_card_1.dart';
import 'package:komikoproject/domain/model/komik/komik_model_4.dart';

class BodyWidget extends StatelessWidget {
  final KomikModel4 data;
  const BodyWidget({super.key, required this.data});

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
          itemCount: data.data?.length,
          itemBuilder: (context, index) {
            return KomikCard1(
                height: Get.height.toInt(),
                width: Get.width.toInt(),
                data: data.data![index]);
          }),
    );
  }
}
