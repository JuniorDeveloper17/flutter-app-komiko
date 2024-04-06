import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:komikoproject/domain/model/komik/detail_model.dart';
import '../../../../core/theme/color.dart';

class AppBarKomik extends StatelessWidget {
  final DetailKomikModel data;
  const AppBarKomik({
    super.key,required this.data
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: black,
      title: AutoSizeText(
        '${data.title}',
        style: TextStyle(color: white, fontSize: 17),
      ),
    );
  }
}
