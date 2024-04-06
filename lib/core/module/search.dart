
import 'package:flutter/material.dart';
import '../controller/controller.dart';
import 'future_builder.dart';
import '../../domain/repositori/komik_data_repositori.dart';
import '../../app/home/widget/app_bar_1.dart';
import '../../app/module/search_komik/view/search_komik.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
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
      ]);
  }
}
