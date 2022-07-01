import 'package:flutter/material.dart';
import 'package:rbtwebsite/HomePages/homeBar.dart';
import 'package:rbtwebsite/HomePages/imagesViewer.dart';
import 'package:rbtwebsite/HomePages/logosDisplayer.dart';
import 'package:rbtwebsite/HomePages/servicesDisplayer.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:vitality/models/ItemBehaviour.dart';
import 'package:vitality/models/WhenOutOfScreenMode.dart';
import 'package:vitality/vitality.dart';

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
  List<Widget> pageWidgets = [];
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
    initPages();
    pageHeight = MediaQuery.of(context).size.height +
        300 +
        (MediaQuery.of(context).size.height / 1.5) * 3;
    setState(() {});
    return mainPage(context);
  }

  SingleChildScrollView mainPage(BuildContext context) {
    return SingleChildScrollView(
    child: Stack(
      fit: StackFit.passthrough,
      children: [
        Vitality.randomly(
            minOpacity: 0.5,
            maxOpacity: 0.6,
            minSize: 50,
            maxSize: 100,
            itemsCount: 150,
            whenOutOfScreenMode: WhenOutOfScreenMode.Teleport,
            height: pageHeight,
            width: MediaQuery.of(context).size.width,
            randomItemsBehaviours: [
              ItemBehaviour(shape: ShapeType.FilledCircle)
            ],
            randomItemsColors: [
              Colors.orange,
              Colors.blueGrey,
              Colors.cyan[900]!
            ]),
        Column(
          children: [
            const HomePageBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView.builder(
                  itemCount: pageWidgets.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) => pageWidgets[index]),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
  }

  void initPages() {
    pageWidgets.addAll([
      const ServicesDisplayer(),
      ImageViewer(currentSize: currentSize),
      const LogosDisplayer(),
      Container(
        color: Colors.grey[200],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.25,
      )
    ]);
  }
}
