import 'package:flutter/material.dart';
import '../widget/body.dart';

class FavoirdKomik extends StatelessWidget {
  const FavoirdKomik({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CustomScrollView(
              slivers: [
                SliverList.list(children: [SizedBox(height: 60)]),
                BodyWidget()
              ],
            )));
  }
}
