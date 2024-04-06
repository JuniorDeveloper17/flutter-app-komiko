import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/module/detail_komik/view/detail_komik.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:komikoproject/domain/model/komik/komik_model_favorid.dart';
import '../theme/color.dart';

class KomikCard5 extends StatelessWidget {
  const KomikCard5({
    super.key,
    required this.data,
  });

  final KomikModelFavorid data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: Get.width,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(color: black2),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: '${data.image}',
            imageBuilder: (context, imageProvider) => Container(
              width: 120,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width / 2,
                child: Text(
                  '${data.title}',
                  style: TextStyle(
                      color: white, fontSize: 16, fontWeight: FontWeight.w600),
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 5),
              Material(
                shadowColor: black2,
                elevation: 1.5,
                child: Image.asset(
                    height: 18,
                    data.jenis == ''
                        ? 'assets/image/none.png'
                        : 'assets/image/${data.jenis?.toLowerCase()}.png',
                    width: 27),
              ),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBarIndicator(
                    rating: double.parse('${data.ratting}'.split(' ')[0]) / 2,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    unratedColor: grey800,
                    itemCount: 5,
                    itemSize: 13.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(width: 10),
                  AutoSizeText(
                    '${data.ratting}'.split(' ')[0],
                    style: TextStyle(
                      color: grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: grey,
                    size: 17,
                  ),
                  SizedBox(width: 10),
                  AutoSizeText(
                    '${data.ratting}'.split(' ').skip(1).join(' '),
                    style: TextStyle(
                      color: grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox()),
              Row(
                children: [
                  InkWell(
                    onTap: () => Get.to(() => DetailKomik(url: data.url!)),
                    child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: green),
                      child: AutoSizeText(
                        'Baca',
                        style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  InkWell(
                    onTap: () => favorid.delete_favorid(id: data.id!),
                    child: Container(
                      height: 40,
                      width: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: blue3),
                      child: AutoSizeText(
                        'Hapus',
                        style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
