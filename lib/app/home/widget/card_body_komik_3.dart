import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/domain/model/komik/komik_model_3.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import '../../../core/module/future_builder.dart';
import '../../../core/module/komik_card_3.dart';
import '../../../core/theme/color.dart';
import '../../../domain/repositori/komik_data_repositori.dart';

class CardBodyKomik3 extends StatelessWidget {
  const CardBodyKomik3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      SizedBox(height: 20),
      DefaultTabController(
          length: 4,
          child: Container(
            height: 400,
            width: Get.width,
            decoration: BoxDecoration(color: black2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: AutoSizeText(
                    'Komik Genre Pilihan',
                    style: TextStyle(
                        color: white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Divider(color: grey800, thickness: 0.8, height: 0),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TabBar(
                    tabs: [
                      AutoSizeText('Romantis'),
                      AutoSizeText('Isekai'),
                      AutoSizeText('Fantasy'),
                      AutoSizeText('Aksi'),
                    ],
                    indicator: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(3)),
                    labelPadding: EdgeInsets.all(10),
                    labelColor: white,
                    unselectedLabelColor: grey100,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TabBarView(children: [
                      CustomFutureBuilder(
                          futureProvider: () =>
                              KomikDataRepositori().romantis(),
                          loadingBuilder: (p0) => SizedBox(),
                          errorBuilder: (p0, p1) => SizedBox(),
                          dataBuilder: (p0, data) {
                            return WidgetTabBar(data: data);
                          }),
                      CustomFutureBuilder(
                          futureProvider: () => KomikDataRepositori().isekai(),
                          loadingBuilder: (p0) => SizedBox(),
                          errorBuilder: (p0, p1) => SizedBox(),
                          dataBuilder: (p0, data) {
                            return WidgetTabBar(data: data);
                          }),
                      CustomFutureBuilder(
                          futureProvider: () => KomikDataRepositori().fantasi(),
                          loadingBuilder: (p0) => SizedBox(),
                          errorBuilder: (p0, p1) => SizedBox(),
                          dataBuilder: (p0, data) {
                            return WidgetTabBar(data: data);
                          }),
                      CustomFutureBuilder(
                          futureProvider: () => KomikDataRepositori().aksi(),
                          loadingBuilder: (p0) => SizedBox(),
                          errorBuilder: (p0, p1) => SizedBox(),
                          dataBuilder: (p0, data) {
                            return WidgetTabBar(data: data);
                          }),
                    ]),
                  ),
                )
              ],
            ),
          ))
    ]));
  }
}

class WidgetTabBar extends StatelessWidget {
  final List<KomikModel3> data;
  WidgetTabBar({super.key, required this.data});

  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return VsScrollbar(
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
        controller: controller,
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
              child: Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 30),
            child: KomikCard3(
              height: 180,
              width: 150,
              data: data[index]
            ),
          ));
        },
      ),
    );
  }
}
