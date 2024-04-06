import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:komikoproject/domain/model/komik/komik_model_favorid.dart';
import '../../../../core/theme/color.dart';
import '../../../../domain/model/komik/detail_model.dart';

class HeaderKomik extends StatelessWidget {
  final DetailKomikModel data;
  final String url;
  const HeaderKomik({super.key, required this.data, required this.url});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverList(
          delegate: SliverChildListDelegate([
        Row(
          children: [
            Flexible(
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: black3),
                child: AutoSizeText(
                  '${data.chapterBegin}',
                  style: TextStyle(
                      color: green, fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: black3),
                child: AutoSizeText(
                  '${data.chapterNow}',
                  style: TextStyle(
                      color: green2, fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 30),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 220,
            width: 170,
            decoration: BoxDecoration(
                color: black3,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1.3, color: white),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage('${data.image}'))),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${data.ratting?.split(' ')[0]}',
                style: TextStyle(color: green2, fontSize: 40),
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBarIndicator(
                    rating: double.parse('${data.ratting?.split(' ')[0]}') / 2,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    unratedColor: grey,
                    itemCount: 5,
                    itemSize: 15.0,
                    direction: Axis.horizontal,
                  ),
                  AutoSizeText(
                    ' ${data.ratting?.split(' ').skip(1).join(' ')}',
                    style: TextStyle(color: green2, fontSize: 12, height: 2),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: black3),
                child: Obx(
                  () => Icon(
                    Icons.favorite_border_outlined,
                    color: favorid.komik_favorid
                            .any((element) => element.url!.contains(url))
                        ? amber
                        : green,
                  ),
                )),
            InkWell(
              onTap: () => favorid.komik_favorid
                      .any((element) => element.url!.contains(url))
                  ? null
                  : favorid.save_favorid_komik(
                      data: KomikModelFavorid(
                      image: data.image,
                      title: data.title,
                      ratting: data.ratting,
                      url: url,
                      jenis: data.jenis,
                    )),
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: black2),
                child: AutoSizeText(
                  'Tambahkan Ke Favorit',
                  style: TextStyle(color: white, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ])),
    );
  }
}
