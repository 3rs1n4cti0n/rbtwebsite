import 'package:flutter/material.dart';
import 'package:rbtwebsite/HomePages/home_page_navbar.dart';
import 'package:rbtwebsite/HomePages/home_pages.dart';

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
  Widget build(BuildContext context) {
    
    return mainPage(context);
  }
  
  Widget mainPage(BuildContext context) {

    return Row(
      children: [
        HomePageNavigatorBar(),
        HomePages(),
      ],
    );
  }
}
