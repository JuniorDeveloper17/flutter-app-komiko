import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/module/baca_komik/view/baca_komik.dart';
import 'package:komikoproject/core/theme/color.dart';
import '../../../../domain/model/komik/detail_model.dart';

class DeskripsiKomik extends StatelessWidget {
  final DetailKomikModel data;
  const DeskripsiKomik({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverList(
          delegate: SliverChildListDelegate([
        SizedBox(height: 20),
        DefaultTabController(
            length: 3,
            child: Container(
              color: black2,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: TabBar(
                      tabs: [
                        AutoSizeText('Sinopsis'),
                        AutoSizeText('Spoiler'),
                        AutoSizeText('Chapter'),
                      ],
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      indicator: BoxDecoration(
                          color: green, borderRadius: BorderRadius.circular(3)),
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                      labelColor: white,
                      unselectedLabelColor: grey100,
                    ),
                  ),
                  Divider(
                    color: grey,
                    thickness: 0.5,
                  ),
                  Container(
                    height: 350,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: TabBarView(children: [
                      SinopsisWidget(data: data.synopsis!),
                      SpoilerWidget(data: data.spolier!),
                      ChapterWidget(data: data.chapters!)
                    ]),
                  )
                ],
              ),
            ))
      ])),
    );
  }
}

class ChapterWidget extends StatelessWidget {
  final List<Chapters> data;
  ChapterWidget({super.key, required this.data});
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      child: ListView.builder(
          controller: controller,
          itemCount: data.length,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to(() => BacaKomik(url: data[index].url!)),
              child: Container(
                height: 40,
                width: Get.width,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(border: Border.all(color: black3)),
                child: AutoSizeText(
                  '${data[index].chapter}',
                  style: TextStyle(color: green2, fontSize: 15),
                ),
              ),
            );
          }),
    );
  }
}

class SpoilerWidget extends StatelessWidget {
  final List<String> data;
  const SpoilerWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 8 / 8,
            crossAxisCount: 1),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage('${data[index]}'))),
          );
        });
  }
}

class SinopsisWidget extends StatelessWidget {
  final String data;
  const SinopsisWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      children: [
        Text(
          '${data}',
          style: TextStyle(
              color: white,
              fontSize: 15,
              height: 1.5,
              fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
