import 'package:flutter/material.dart';
import '../../../../core/module/future_builder.dart';
import '../../../../domain/repositori/komik_data_repositori.dart';
import '../widget/appbar_komik.dart';
import '../widget/deskripsi_komik.dart';
import '../widget/header_komik.dart';
import '../widget/info_komik.dart';
import '../widget/mirip_komik.dart';

class DetailKomik extends StatelessWidget {
  final String url;
  const DetailKomik({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomFutureBuilder(
          futureProvider: () => KomikDataRepositori().detail_komik(url: url),
          loadingBuilder: (p0) => SizedBox(),
          errorBuilder: (p0, p1) => SizedBox(),
          dataBuilder: (p0, data) {
            return CustomScrollView(
              slivers: [
                AppBarKomik(data: data),
                HeaderKomik(data: data, url : url),
                InfoKomik(data: data),
                DeskripsiKomik(data: data),
                MiripKomik(data: data)
              ],
            );
          }),
    );
  }
}
