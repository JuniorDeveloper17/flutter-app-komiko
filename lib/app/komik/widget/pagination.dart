import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:get/get.dart';
import 'package:komikoproject/core/controller/controller.dart';
import 'package:komikoproject/core/theme/color.dart';

class PaginationWidget extends StatelessWidget {
  final String now;
  final String? max;
  const PaginationWidget({super.key, required this.now, required this.max});

  @override
  Widget build(BuildContext context) {
    print(max);
    return SliverList.list(children: [
      SizedBox(height: 20),
      Center(
        child: Pagination(
          width: Get.width,
          height: 45,
          paginateButtonStyles: PaginateButtonStyles(
              backgroundColor: black2, activeBackgroundColor: green),
          prevButtonStyles: PaginateSkipButton(
              buttonBackgroundColor: grey800,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          nextButtonStyles: PaginateSkipButton(
              buttonBackgroundColor: black3,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          onPageChange: (number) {
            daftar_k.pageSelect.value = number;
            daftar_k.next_page();
          },
          useGroup: false,
          totalPage: int.parse('${max}'),
          show: 2,
          currentPage: int.parse('${now}'),
        ),
      ),
      SizedBox(height: 20)
    ]);
  }
}
