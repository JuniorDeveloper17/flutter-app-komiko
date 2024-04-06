import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:komikoproject/core/theme/color.dart';

class HeaderWidget extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double kToolbarHeight;

  HeaderWidget({
    required this.expandedHeight,
    required this.kToolbarHeight,
  });

  final controller = ScrollController();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        height: kToolbarHeight,
        width: Get.width,
        child: Container(
          decoration: BoxDecoration(color: black),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TabBar(
            tabs: [
              AutoSizeText('Manga'),
              AutoSizeText('Manhwa'),
              AutoSizeText('Manhua'),
            ],
            indicator: BoxDecoration(
                color: green, borderRadius: BorderRadius.circular(3)),
            labelPadding: EdgeInsets.all(10),
            labelColor: white,
            unselectedLabelColor: grey100,
            onTap: (value) {
              daftar_k.next_page();
              daftar_k.pageSelect.value = 1;
              daftar_k.jenisKomik.value = value;
            },
          ),
        ));
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
