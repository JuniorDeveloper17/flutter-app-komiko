import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/module/jenis_page/view/tema_page.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import '../../../core/theme/color.dart';

class CardTemaKomik extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double kToolbarHeight;
  final String title;
  final List<String> data;

  CardTemaKomik(
      {required this.expandedHeight,
      required this.kToolbarHeight,
      required this.title,
      required this.data});

  final controller = ScrollController();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: kToolbarHeight,
      width: Get.width,
      child: Container(
        color: black2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 20, width: Get.width, color: black),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AutoSizeText(
                '${title}',
                style: TextStyle(
                    color: white, fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            Divider(color: grey800, thickness: 0.6, height: 35),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: VsScrollbar(
                  controller: controller,
                  showTrackOnHover: true,
                  isAlwaysShown: true,
                  style: VsScrollbarStyle(
                    hoverThickness: 10.0,
                    radius: Radius.circular(3),
                    thickness: 10.0,
                    color: grey800,
                  ),
                  child: ListView.builder(
                    itemCount: data.length,
                    controller: controller,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                           genre_p.pageSelect.value = 1;
                           Get.to(() => TemaPage(keys: '${data[index]}'));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 30, right: 20),
                          child: Container(
                            height: Get.height,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(color: black3),
                            child: AutoSizeText(
                              '${data[index]}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(height: 20, width: Get.width, color: black),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
