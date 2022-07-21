import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rbtwebsite/PageViewPages/about_me.dart';
import 'package:rbtwebsite/Utilities/index_pages.dart';

class HomePages extends StatefulWidget {
  HomePages({Key? key, required this.onPageChangedNotifyParent, required this.controller})
      : super(key: key);

  late PageController controller;
  final VoidCallback onPageChangedNotifyParent;

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  late ScrollPhysics _scrollPhysics;
  @override
  void initState() {
    _scrollPhysics = const ScrollPhysics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: SelectedIndex.selectedIndex,
        builder: (context, value, child) {
          return SizedBox(
            width: MediaQuery.of(context).size.width - 400,
            height: double.infinity,
            child: PageView(
              dragStartBehavior: DragStartBehavior.down,
              onPageChanged: ((newPage) {
                SelectedIndex.selectedIndex.value = newPage;
              }),
              controller: widget.controller,
              scrollDirection: Axis.vertical,
              physics: _scrollPhysics,
              children: [
                AboutMe(),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.green,
                ),
                AboutMe(),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          );
        });
  }
}
