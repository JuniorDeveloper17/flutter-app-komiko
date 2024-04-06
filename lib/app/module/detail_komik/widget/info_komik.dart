import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/controller/controller.dart';
import '../../../../core/theme/color.dart';
import '../../../../domain/model/komik/detail_model.dart';
import '../../jenis_page/view/genre_page.dart';

class InfoKomik extends StatelessWidget {
  final DetailKomikModel data;
  const InfoKomik({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverList(
          delegate: SliverChildListDelegate([
        SizedBox(height: 20),
        data.informasi?.length == 0
            ? SizedBox()
            : AutoSizeText(
                'Informasi',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w500),
              ),
        SizedBox(height: data.informasi?.length == 0 ? 0 : 15),
        SizedBox(
          height: data.informasi?.length == 0 ? 0 : 25,
          width: Get.width,
          child: ListView.builder(
              itemCount: data.informasi?.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Image.network('${data.informasi?[index].img}',
                        width: 20, height: 20),
                    SizedBox(width: 10),
                    AutoSizeText(
                      '${data.informasi?[index].title}',
                      style: TextStyle(color: green2, fontSize: 14),
                    ),
                    SizedBox(width: 10)
                  ],
                );
              }),
        ),
        SizedBox(height: 20),
        WidgetInfo(
          width: Get.width.toInt(),
          title: 'Judul Alternatif',
          subtitle: '${data.titleAlternatif}',
        ),
        WidgetInfo(
          width: Get.width.toInt(),
          title: 'Pengarang',
          subtitle: '${data.pengarang}',
        ),
        WidgetInfo(
          width: Get.width.toInt(),
          title: 'Jumlah Pembaca',
          subtitle: '${data.jumlahPembaca}',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetInfo(
              width: Get.width ~/ 2.6,
              title: 'Status',
              subtitle: '${data.status}',
            ),
            WidgetInfo(
              width: Get.width ~/ 2.6,
              title: 'Grafis',
              subtitle: data.grafis == '' ? 'Nan' : '${data.grafis}',
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetInfo(
              width: Get.width ~/ 2.6,
              title: 'Jenis',
              subtitle: '${data.jenis}',
            ),
            WidgetInfo(
              width: Get.width ~/ 2.6,
              title: 'Official',
              subtitle: data.official == '' ? 'Nan' : '${data.official}',
            )
          ],
        ),
        SizedBox(height: 30),
        AutoSizeText(
          'Genre Komik',
          style: TextStyle(
              color: white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 35,
          width: Get.width,
          child: ListView.builder(
              itemCount: data.genre?.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    genre_p.pageSelect.value = 1;
                    Get.to(() => GenrePage(
                        keys: '${data.genre?[index]}'.replaceAll(' ', '-')));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: black2,
                          border: Border.all(color: green2)),
                      child: AutoSizeText(
                        '${data.genre?[index]}',
                        style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )),
                );
              }),
        ),
      ])),
    );
  }
}

class WidgetInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final int width;
  const WidgetInfo(
      {super.key,
      required this.subtitle,
      required this.title,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.toDouble(),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: grey, offset: Offset(-0.3, 0.3))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            '${title}',
            style: TextStyle(
                color: white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          AutoSizeText(
            '${subtitle}',
            style: TextStyle(
                color: grey200,
                fontSize: 13,
                height: 1.5,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
