import 'package:flutter/material.dart';
import 'package:rbtwebsite/HomePages/homeBar.dart';
import 'package:rbtwebsite/HomePages/imagesViewer.dart';
import 'package:rbtwebsite/HomePages/logosDisplayer.dart';
import 'package:rbtwebsite/HomePages/servicesAnimatedProgress.dart';
import 'package:rbtwebsite/HomePages/servicesDisplayer.dart';
import 'package:show_up_animation/show_up_animation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final initWidth = 0.0;
  final initHeight = 0.0;
  final maxHeight = 500.0;
  final maxWidth = 800.0;
  late Size currentSize;
  late double pageHeight;
  late double screenWidth = MediaQuery.of(context).size.width;
  late double screenHeight = MediaQuery.of(context).size.height;

  @override
  void initState() {
    currentSize = Size(maxWidth, maxHeight);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pageHeight = MediaQuery.of(context).size.height +
        300 +
        (MediaQuery.of(context).size.height / 1.5) * 5;
    setState(() {});
    return mainPage(context);
  }

  Widget mainPage(BuildContext context) {
    return Container(
      height: pageHeight,
      width: MediaQuery.of(context).size.width,
      color: Colors.blueGrey[700],
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomePageBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: Column(
                    children: [
                      ShowUpAnimation(child: const ServicesDisplayer()),
                      ImageViewer(currentSize: currentSize),
                      const LogosDisplayer(),
                      const ServicesWithAnimation(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
