import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rbtwebsite/Utilities/animatedTechs.dart';

class ServicesWithAnimation extends StatefulWidget {
  ServicesWithAnimation({Key? key}) : super(key: key);

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
  
  double calcHeight()
  {
    if(MediaQuery.of(context).size.height < 860)
      return MediaQuery.of(context).size.height + 100;

    return -1;
  }

  @override
  Widget build(BuildContext context) {
    initImagePaths();
    return Container(
      width: MediaQuery.of(context).size.width / 1.25,
      height: calcHeight(),
      color: Colors.white.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          child: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    "TECHNOLOGIES",
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 3,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    for (int i = 0; i < imagePaths.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: AnimatedTechnologies(
                            path: imagePaths.keys.elementAt(i),
                            percent: imagePaths.values.elementAt(i),
                            progressColor: colorMap.elementAt(i)),
                      ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
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
}
