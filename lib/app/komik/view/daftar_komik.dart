import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/core/module/search.dart';
import 'package:komikoproject/domain/repositori/komik_data_repositori.dart';
import '../../../core/controller/controller.dart';
import '../../../core/module/future_builder.dart';
import '../../home/widget/app_bar_1.dart';
import '../widget/body_widget.dart';
import '../widget/header_widget.dart';
import '../widget/pagination.dart';

class DaftarKomik extends StatelessWidget {
  const DaftarKomik({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DefaultTabController(
          length: 3,
          child: Obx(() => home.searchValue.value == ''
              ? daftar_k.refres.isTrue
                  ? Center(child: CircularProgressIndicator())
                  : CustomFutureBuilder(
                      futureProvider: () {
                        if (daftar_k.jenisKomik.value == 0) {
                          return KomikDataRepositori().tipe_page(
                              key: 'manga',
                              page: '${daftar_k.pageSelect.value}');
                        } else if (daftar_k.jenisKomik.value == 1) {
                          return KomikDataRepositori().tipe_page(
                              key: 'manhwa',
                              page: '${daftar_k.pageSelect.value}');
                        } else {
                          return KomikDataRepositori().tipe_page(
                              key: 'manhua',
                              page: '${daftar_k.pageSelect.value}');
                        }
                      },
                      loadingBuilder: (p0) => SizedBox(),
                      errorBuilder: (p0, p1) => SizedBox(),
                      dataBuilder: (p0, data) {
                        return CustomScrollView(
                          physics: BouncingScrollPhysics(),
                          slivers: [
                            AppBar1(),
                            SliverPersistentHeader(
                                pinned: true,
                                delegate: HeaderWidget(
                                    kToolbarHeight: 60, expandedHeight: 60)),
                            BodyWidget(data: data),
                            data.maxPage == null
                                ? SliverList.list(children: [])
                                : PaginationWidget(
                                    now: data.pageNow!, max: data.maxPage)
                          ],
                        );
                      })

              //===SEARCH WIDGET
              : SearchWidget()),
        ),
      ),
    );
  }
}
