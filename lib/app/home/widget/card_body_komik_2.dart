import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:komikoproject/domain/model/komik/komik_model_2.dart';
import '../../../core/module/komik_card_2.dart';
import '../../../core/theme/color.dart';

class CardBodyKomik2 extends StatelessWidget {
  final List<KomikModel2> data;
  const CardBodyKomik2({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      SizedBox(height: 20),
      Container(
        decoration: BoxDecoration(color: black2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: AutoSizeText(
                'Komik Terbaru',
                style: TextStyle(
                    color: white, fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ),
            Divider(color: grey800, thickness: 0.8, height: 0),
            ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                itemBuilder: (context, index) {
                  return KomikCard2(data: data[index]);
                })
          ],
        ),
      )
    ]));
  }
}
