import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/home/widget/card_genre_komik.dart';
import 'package:komikoproject/app/home/widget/app_bar_1.dart';
import 'package:komikoproject/app/home/widget/card_tema_komik.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:komikoproject/core/module/future_builder.dart';
import 'package:komikoproject/domain/repositori/komik_data_repositori.dart';
import '../../module/search_komik/view/search_komik.dart';
import '../widget/card_body_komik_1.dart';
import '../widget/card_body_komik_2.dart';
import '../widget/card_body_komik_3.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => home.searchValue.value == ''
                ? CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
                    AppBar1(),

                    //====kOMIK popular
                    CustomFutureBuilder(
                        futureProvider: () =>
                            KomikDataRepositori().terpopular(),
                        loadingBuilder: (p0) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        errorBuilder: (p0, p1) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        dataBuilder: (p0, data) {
                          return CardBodyKomik(
                              title: 'Komik Terpopular', data: data);
                        }),

                    //====kOMIK GENRE PILIHAN
                    CardBodyKomik3(),

                    //====KOMIK GENRE
                    CustomFutureBuilder(
                        futureProvider: () => KomikDataRepositori().genre(),
                        loadingBuilder: (p0) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        errorBuilder: (p0, p1) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        dataBuilder: (p0, data) {
                          return SliverPersistentHeader(
                              pinned: true,
                              delegate: CardGenreKomik(
                                  expandedHeight: 180,
                                  kToolbarHeight: 180,
                                  title: 'Genre Komik',
                                  data: data));
                        }),

                    //====kOMIK TERBARU
                    CustomFutureBuilder(
                        futureProvider: () => KomikDataRepositori().terbaru(),
                        loadingBuilder: (p0) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        errorBuilder: (p0, p1) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        dataBuilder: (p0, data) {
                          return CardBodyKomik2(data: data);
                        }),

                    //====kOMIK BERWARNA
                    CustomFutureBuilder(
                        futureProvider: () => KomikDataRepositori().berwarna(),
                        loadingBuilder: (p0) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        errorBuilder: (p0, p1) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        dataBuilder: (p0, data) {
                          return CardBodyKomik(
                              title: 'Komik Berwarna', data: data);
                        }),

                    //====KOMIK TEMA
                    CustomFutureBuilder(
                        futureProvider: () => KomikDataRepositori().tema(),
                        loadingBuilder: (p0) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        errorBuilder: (p0, p1) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        dataBuilder: (p0, data) {
                          return SliverPersistentHeader(
                              pinned: true,
                              delegate: CardTemaKomik(
                                  expandedHeight: 180,
                                  kToolbarHeight: 180,
                                  title: 'Tema Komik',
                                  data: data));
                        }),
                  ])
                :
                //====kOMIK SEARCH
                CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
                    AppBar1(),
                    CustomFutureBuilder(
                        futureProvider: () => KomikDataRepositori()
                            .search(key: home.searchValue.value),
                        loadingBuilder: (p0) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        errorBuilder: (p0, p1) =>
                            SliverList(delegate: SliverChildListDelegate([])),
                        dataBuilder: (p0, data) {
                          return SearchKomik(data: data);
                        }),
                  ]),
          )),
    );
  }
}
