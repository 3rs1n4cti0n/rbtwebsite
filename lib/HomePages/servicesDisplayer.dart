import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

class ServicesDisplayer extends StatefulWidget {
  const ServicesDisplayer({Key? key}) : super(key: key);

  @override
  State<ServicesDisplayer> createState() => _ServicesDisplayerState();
}

class _ServicesDisplayerState extends State<ServicesDisplayer> {
  late ScrollController listAnimationController;
  late final Map<String, String> servicesMap = <String, String>{};
  late final Shader gradient;

  @override
  void initState() {
    initServices();
    getGradient();
    listAnimationController = ScrollController();
    super.initState();
  }

  Shader getGradient() {
    return gradient = LinearGradient(
            colors: [Colors.cyan[900]!,Colors.orange[900]!, Colors.cyan[900]!])
        .createShader(const Rect.fromLTWH(0.0, 0.0, 700.0, 70.0));
  }

  void initServices() {
    servicesMap.putIfAbsent(
        "Personal            Website",
        () =>
            "Can create personal website for you and your business. Help you reach out to your customers and help them reach you easier.");
    servicesMap.putIfAbsent(
        "Business Mobile Application",
        () =>
            "Personal shop for your business. Make it easier for your customers to order and for you to follow their order.");
    servicesMap.putIfAbsent("Cross-Platform Application",
        () => "Cross-Platform apps for Android, Windows and the Web.");
    servicesMap.putIfAbsent(
        "Background Images",
        () =>
            "Background images that can be used on your phone, tablet and computer.");
    servicesMap.putIfAbsent(
        "Logos", () => "Logo images that can be used for your applications.");
  }

  double calcHeight() {
    if (MediaQuery.of(context).size.width >= 600) {
      return MediaQuery.of(context).size.height;
    }
    if (MediaQuery.of(context).size.height < 900) {
      return MediaQuery.of(context).size.height * 1.5;
    }
    return MediaQuery.of(context).size.height * 1.25;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200]?.withOpacity(0.7),
      height: calcHeight(),
      width: MediaQuery.of(context).size.width / 1.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [
          const Center(
            child: Text(
              "SERVICES",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (MediaQuery.of(context).size.width > 750)
                    ShowUpAnimation(
                      direction: Direction.horizontal,
                      child: Image(
                        height: MediaQuery.of(context).size.height / 1.1,
                        fit: BoxFit.scaleDown,
                        image: const AssetImage(
                            '../Assets/Backgrounds_Phone/background_7.png'),
                      ),
                    ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: AnimatedList(
                          initialItemCount: servicesMap.length,
                          controller: listAnimationController,
                          itemBuilder: (context, index, animation) {
                            return ShowUpAnimation(
                              delayStart:
                                  Duration(milliseconds: 125 * (index + 1)),
                              animationDuration: const Duration(seconds: 2),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      servicesMap.keys.elementAt(index),
                                      style: TextStyle(
                                          fontSize: 28,
                                          decoration: TextDecoration.none,
                                          foreground: Paint()
                                            ..shader = gradient),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Text(
                                      servicesMap.values.elementAt(index),
                                      style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 20,
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })),
                  const SizedBox(
                    width: 20,
                  ),
                  if (MediaQuery.of(context).size.width > 1280)
                    ShowUpAnimation(
                      direction: Direction.horizontal,
                      child: Image(
                        height: MediaQuery.of(context).size.height / 1.1,
                        fit: BoxFit.contain,
                        image: const AssetImage(
                            '../Assets/Backgrounds_Phone/background_8.png'),
                      ),
                    ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
