import 'package:flutter/material.dart';
import 'package:rbtwebsite/HomePages/homeBar.dart';
import 'package:rbtwebsite/HomePages/imagesViewer.dart';
import 'package:rbtwebsite/HomePages/logosDisplayer.dart';
import 'package:rbtwebsite/HomePages/servicesDisplayer.dart';
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
    return Stack(
      fit: StackFit.expand,
      children: [
        Vitality.randomly(
            minOpacity: 0.5,
            maxOpacity: 0.6,
            minSize: 50,
            maxSize: 100,
            itemsCount: 150,
            whenOutOfScreenMode: WhenOutOfScreenMode.Teleport,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            randomItemsBehaviours: [
              ItemBehaviour(shape: ShapeType.FilledCircle)
            ],
            randomItemsColors: [
              Colors.orange,
              Colors.blueGrey,
              Colors.cyan[900]!
            ]),
        SingleChildScrollView(
          child: Column(
            children: [
              const HomePageBar(),
              const ServicesDisplayer(),
              ImageViewer(currentSize: currentSize),
              const LogosDisplayer(),
              Container(
                color: Colors.grey[200],
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1.25,
              ),
            ],
          ),
        ),
      ],
    );
  }

}


