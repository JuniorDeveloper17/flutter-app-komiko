import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/module/detail_komik/view/detail_komik.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import '../../../../core/module/komik_card_4.dart';
import '../../../../core/theme/color.dart';
import '../../../../domain/model/komik/detail_model.dart';

class MiripKomik extends StatelessWidget {
  final DetailKomikModel data;

  MiripKomik({super.key, required this.data});

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverList(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: AutoSizeText(
                  'Mirip Dengan ${data.title}',
                  style: TextStyle(
                      color: white, fontSize: 17, fontWeight: FontWeight.w700),
                  maxLines: 1,
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
                      itemCount: data.mirip?.length,
                      controller: controller,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15, bottom: 35),
                          child: InkWell(
                              onTap: () => Get.to(
                                  () => DetailKomik(
                                        url: '',
                                      ),
                                  preventDuplicates: false),
                              child: KomikCard4(
                                height: Get.width.toInt(),
                                width: 150,
                                data: data.mirip![index])),
                        );
                      }),
                ),
              ))
            ],
          ),
        )
      ])),
    );
  }
}
