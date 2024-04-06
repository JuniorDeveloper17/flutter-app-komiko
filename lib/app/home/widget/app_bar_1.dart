import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:komikoproject/core/controller/controller.dart';
import '../../../core/theme/color.dart';

class AppBar1 extends StatelessWidget {
  const AppBar1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: black,
      leadingWidth: 40,
      leading: Image.asset(
        'assets/icon/logo.png',
      ),
      title: SizedBox(
        height: 45,
        child: TextField(
          controller: home.searchText,
          style: TextStyle(
              color: white, fontSize: 15, fontWeight: FontWeight.w500),
          onEditingComplete: () {
            home.searchValue.value = home.searchText.value.text;
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          decoration: InputDecoration(
              filled: true,
              fillColor: black2,
              hintText: 'Cari...',
              suffixIcon: Obx(
                () => home.searchValue.value == ''
                    ? Icon(Icons.search, color: grey100, size: 25)
                    : IconButton(
                        onPressed: () {
                          home.searchText.clear();
                          home.searchValue.value = '';
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        icon: Icon(Icons.cancel, color: green2, size: 25)),
              ),
              hintStyle: TextStyle(color: grey, fontSize: 15, letterSpacing: 1),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(5))),
        ),
      ),
    );
  }
}
