import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/module/future_builder.dart';
import '../../../../core/theme/color.dart';
import '../../../../domain/repositori/komik_data_repositori.dart';

class BacaKomik extends StatelessWidget {
  final String url;
  const BacaKomik({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomFutureBuilder(
          futureProvider: () => KomikDataRepositori().baca_komik(url: url),
          loadingBuilder: (p0) => SizedBox(),
          errorBuilder: (p0, p1) => SizedBox(),
          dataBuilder: (p0, data) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: black,
                  title: AutoSizeText(
                    '${data.title}',
                    style: TextStyle(color: white, fontSize: 17),
                  ),
                ),
                SliverList.builder(
                    itemCount: data.image?.length,
                    itemBuilder: (context, index) {
                      return Image.network('${data.image?[index]}');
                    }),
                SliverList(
                    delegate: SliverChildListDelegate([
                  SizedBox(height: 20),
                  Row(
                    children: [
                      data.chapterBegin == null
                          ? SizedBox()
                          : Flexible(
                              child: InkWell(
                                onTap: () => Get.to(
                                    BacaKomik(
                                        url: data.chapterBegin!.replaceAll(
                                            'https://komikindo.tv', '')),
                                    preventDuplicates: false),
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: black2),
                                  child: AutoSizeText(
                                    'Sebelumnya',
                                    style:
                                        TextStyle(color: white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                      data.chapterNext == null
                          ? SizedBox()
                          : Flexible(
                              child: InkWell(
                                onTap: () => Get.to(
                                    BacaKomik(
                                        url: data.chapterNext!.replaceAll(
                                            'https://komikindo.tv', '')),
                                    preventDuplicates: false),
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: green2),
                                  child: AutoSizeText(
                                    'Berikutnya',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ),
                            )
                    ],
                  ),
                  SizedBox(height: 20)
                ]))
              ],
            );
          }),
    );
  }
}
