import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/module/detail_komik/view/detail_komik.dart';
import 'package:komikoproject/domain/model/komik/komik_model_2.dart';
import '../theme/color.dart';

class KomikCard2 extends StatelessWidget {
  final KomikModel2 data;
  const KomikCard2({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(()=>DetailKomik(url: data.url!)),
      child: Container(
        height: 140,
        width: Get.width,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(2), color: black3),
        child: Column(
          children: [
            Row(
              children: [
                CachedNetworkImage(
                    imageUrl: '${data.image}',
                    imageBuilder: (context, imageProvider) => Container(
                        height: 80,
                        width: 80,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ))),
                SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.title}',
                          style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: amber, size: 15),
                            AutoSizeText(
                              ' ${data.ratting}',
                              style: TextStyle(fontSize: 14, color: grey),
                            ),
                            SizedBox(width: 15),
                            Image.asset(
                                'assets/image/${data.type?.toLowerCase()}.png',
                                width: 15),
                            AutoSizeText(
                              '  ${data.type}',
                              style: TextStyle(fontSize: 14, color: grey),
                            ),
                            SizedBox(width: 15),
                            Icon(
                              Icons.remove_red_eye,
                              color: grey,
                              size: 20,
                            ),
                            AutoSizeText(
                              '  ${data.views}',
                              style: TextStyle(fontSize: 14, color: grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Expanded(child: SizedBox()),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color.fromARGB(255, 7, 7, 7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        size: 18,
                        color: green2,
                      ),
                      AutoSizeText(
                        ' ${data.status}',
                        style: TextStyle(fontSize: 14, color: grey),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                AutoSizeText(
                  ' ${data.chapter}',
                  style: TextStyle(fontSize: 14, color: grey),
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.color_lens,
                  color: grey,
                  size: 20,
                ),
                AutoSizeText(
                  ' ${data.color}',
                  style: TextStyle(fontSize: 14, color: grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
