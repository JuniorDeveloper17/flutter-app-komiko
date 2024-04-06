import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:komikoproject/domain/model/komik/komik_model_3.dart';
import '../../app/module/detail_komik/view/detail_komik.dart';
import '../theme/color.dart';

class KomikCard3 extends StatelessWidget {
  final int width;
  final int height;
  final KomikModel3 data;
  const KomikCard3(
      {super.key,
      required this.height,
      required this.width,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => DetailKomik(url: data.url!)),
      child: Container(
        height: height.toDouble(),
        width: width.toDouble(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: '${data.image}',
                imageBuilder: (context, imageProvider) => Container(
                  width: Get.width,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Material(
                            shadowColor: black2,
                            elevation: 1.5,
                            child: Image.asset(
                                data.type == ''
                                    ? 'assets/image/none.png'
                                    : 'assets/image/${data.type?.toLowerCase()}.png',
                                width: 25),
                          )),
                      Expanded(child: SizedBox()),
                      Container(
                        width: width.toDouble(),
                        child: Row(
                          children: [
                            Material(
                              shadowColor: black2,
                              elevation: 1.7,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                    color: yellow,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.color_lens, size: 20),
                                    AutoSizeText(
                                      ' ${data.color}',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800),
                                      maxLines: 1,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              width: Get.width,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '${data.title}',
                    style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBarIndicator(
                        rating: double.parse('${data.ratting}') / 2,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        unratedColor: grey800,
                        itemCount: 5,
                        itemSize: 13.0,
                        direction: Axis.horizontal,
                      ),
                      AutoSizeText(
                        '${data.ratting}',
                        style: TextStyle(
                          color: grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
