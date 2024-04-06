import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/module/jenis_page/view/berwarna_page.dart';
import 'package:komikoproject/app/module/jenis_page/view/popular_page.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:komikoproject/domain/model/komik/komik_model_1.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import '../../../core/module/komik_card_1.dart';
import '../../../core/theme/color.dart';

class CardBodyKomik extends StatelessWidget {
  final String title;
  final List<KomikModel1> data;

  CardBodyKomik({super.key, required this.title, required this.data});
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      SizedBox(height: 20),
      Container(
        height: 370,
        width: Get.width,
        decoration: BoxDecoration(color: black2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: AutoSizeText(
                '${title}',
                style: TextStyle(
                    color: white, fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            Divider(color: grey800, thickness: 0.8, height: 0),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(15),
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
                    itemCount: data.length + 1,
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index == data.length) {
                        return InkWell(
                          onTap: () {
                            genre_p.pageSelect.value = 1;

                            if (title == 'Komik Terpopular') {
                              Get.to(() => PopularPage(keys: 'Komik Popular'));
                            } else {
                              Get.to(() => BerwarnaPage(keys: 'Komik Berwarna'));
                            }
                          },
                          child: Container(
                            height: 180,
                            width: 150,
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              'Lihat Semua...',
                              style: TextStyle(color: white, fontSize: 15),
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                            padding:
                                const EdgeInsets.only(right: 15, bottom: 35),
                            child: KomikCard1(
                              width: 150,
                              height: 180,
                              data: data[index],
                            ));
                      }
                    }),
              ),
            ))
          ],
        ),
      )
    ]));
  }
}
