import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/module/detail_komik/view/detail_komik.dart';

import '../../domain/model/komik/detail_model.dart';
import '../theme/color.dart';

class KomikCard4 extends StatelessWidget {
  final Mirip data;
  final int height;
  final int width;
  const KomikCard4(
      {super.key,
      required this.data,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.to(DetailKomik(url: data.url!), preventDuplicates: false),
      child: Container(
        width: width.toDouble(),
        height: height.toDouble(),
        child: Column(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: green2,
                            shadowColor: black,
                            elevation: 2,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 2),
                              child: AutoSizeText('${data.type}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: black)),
                            ),
                          ),
                          Material(
                            shadowColor: black2,
                            elevation: 1.5,
                            child: Image.asset(
                                height: 18,
                                'assets/image/${data.genre?.split(' ')[0].toLowerCase()}.png',
                                width: 27),
                          )
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Row(
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
                                    ' ${data.genre?.split(' ').last}',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              width: Get.width,
              height: 60,
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
                    AutoSizeText(
                      '${data.deskripsi}',
                      style: TextStyle(
                        color: grey,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
