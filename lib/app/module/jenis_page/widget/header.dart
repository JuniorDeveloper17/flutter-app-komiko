import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/color.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.keys, required this.jenis});

  final String keys;
  final String jenis;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: black,
      toolbarHeight: 10,
      pinned: true,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: AutoSizeText(
          'Komik ${jenis} ${keys}',
          style: TextStyle(
              color: white, fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
