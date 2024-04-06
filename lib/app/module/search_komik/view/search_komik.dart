import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/core/module/komik_card_3.dart';
import 'package:komikoproject/domain/model/komik/komik_model_3.dart';

class SearchKomik extends StatelessWidget {
  final List<KomikModel3> data;
  const SearchKomik({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
              data: data[index],
            );
          }),
    );
  }
}
