import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:rbtwebsite/Utilities/animatedTechs.dart';

class ServicesWithAnimation extends StatefulWidget {
  const ServicesWithAnimation({Key? key}) : super(key: key);

  @override
  State<ServicesWithAnimation> createState() => _ServicesWithAnimationState();
}

class _ServicesWithAnimationState extends State<ServicesWithAnimation> {
  late final Map<String, double> imagePaths = <String, double>{};
  late final List<Color> colorMap = [];
  @override
  void initState() {
    initImagePaths();
    initColors();
    super.initState();
  }

  double calcHeight() {
    if(MediaQuery.of(context).size.width > 1050) {
      return 250;
    }
    if (MediaQuery.of(context).size.width > 650) {
      return imagePaths.length * 250 / 2;
    }
    return imagePaths.length * 250;
  }

  @override
  Widget build(BuildContext context) {
    initImagePaths();
    return Container(
      width: MediaQuery.of(context).size.width / 1.25,
      color: Colors.white.withOpacity(0.7),
      height: calcHeight(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: DynamicHeightGridView(
                  rowCrossAxisAlignment: CrossAxisAlignment.center,
                  crossAxisCount: calculateAxisCount(),
                  mainAxisSpacing: 24,
                  shrinkWrap: true,
                  itemCount: imagePaths.length,
                  builder: (context, index) => AnimatedTechnologies(
                      path: imagePaths.keys.elementAt(index),
                      percent: imagePaths.values.elementAt(index),
                      progressColor: colorMap.elementAt(index)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void initImagePaths() {
    imagePaths.putIfAbsent("../../Assets/serviceLogos/flutter.jpg", () => 0.8);
    imagePaths.putIfAbsent(
        "../../Assets/serviceLogos/vscodelogo.png", () => 0.8);
    imagePaths.putIfAbsent(
        "../../Assets/serviceLogos/c_sharp_logo.png", () => 0.6);
    imagePaths.putIfAbsent(
        "../../Assets/serviceLogos/python_logo.png", () => 0.6);
  }

  void initColors() {
    colorMap.add(Colors.lightBlue);
    colorMap.add(Colors.blue[700]!);
    colorMap.add(Colors.green);
    colorMap.add(Colors.yellow);
  }
  
  calculateAxisCount() {
    if(MediaQuery.of(context).size.width > 1300) {
      return 5;
    }
    if(MediaQuery.of(context).size.width > 1050) {
      return 4;
    }
    if (MediaQuery.of(context).size.width > 850) {
      return 3;
    }
    if (MediaQuery.of(context).size.width > 650) {
      return 2;
    }
    return 1;
  }
}
