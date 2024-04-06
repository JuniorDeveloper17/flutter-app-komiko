import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/app/home/widget/app_bar_1.dart';
import 'package:komikoproject/core/controller/controller.dart';
import '../../../../core/module/future_builder.dart';
import '../../../../domain/repositori/komik_data_repositori.dart';
import '../widget/body_1.dart';
import '../widget/header.dart';
import '../widget/pagination.dart';
import '../../../../core/module/search.dart';

class TemaPage extends StatelessWidget {
  final String keys;
  const TemaPage({super.key, required this.keys});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => home.searchValue.value == ''
            ? genre_p.refres.isTrue
                ? Center(child: CircularProgressIndicator())
                : CustomFutureBuilder(
                    futureProvider: () => KomikDataRepositori().tema_page(
                        key: '${keys}', page: '${genre_p.pageSelect.value}'),
                    loadingBuilder: (p0) => SizedBox(),
                    errorBuilder: (p0, p1) => SizedBox(),
                    dataBuilder: (p0, data) {
                      return CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        slivers: [
                          AppBar1(),
                          HeaderWidget(
                            keys: keys,
                            jenis: 'Tema',
                          ),
                          BodyWidget1(data: data.data!),
                          data.maxPage == null
                              ? SliverList.list(children: [])
                              : PaginationWidget(
                                  now: data.pageNow!, max: data.maxPage)
                        ],
                      );
                    })

//===SEARCH WIDGET
            : SearchWidget(),
      ),
    );
  }
}
