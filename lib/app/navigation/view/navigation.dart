import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controller/controller.dart';
import '../../../core/theme/color.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Obx(() => nav.pageItem.elementAt(nav.pageSelected.value))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Obx(
            () => BottomBarFloating(
                borderRadius: BorderRadius.circular(3),
                items: nav.items,
                backgroundColor: black2,
                color: grey100!,
                colorSelected: Colors.white,
                indexSelected: nav.pageSelected.value,
                onTap: (int index) => {nav.pageSelected.value = index}),
          ),
        ),
      ],
    ));
  }
}