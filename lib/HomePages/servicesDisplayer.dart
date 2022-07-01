import 'package:flutter/material.dart';

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
          colors: [Colors.cyan[900]!, Colors.orange[900]!, Colors.cyan[900]!])
      .createShader(const Rect.fromLTWH(0.0, 0.0, 400.0, 70.0));
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200]?.withOpacity(0.7),
      height: MediaQuery.of(context).size.height,
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
                    Image(
                      height: MediaQuery.of(context).size.height / 1.1,
                      fit: BoxFit.contain,
                      image: const AssetImage(
                          '../Assets/Backgrounds_Phone/background_7.png'),
                    ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: AnimatedList(
                          initialItemCount: servicesMap.length,
                          controller: listAnimationController,
                          itemBuilder: (context, index, animation) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    servicesMap.keys.elementAt(index),
                                    style: TextStyle(
                                        fontSize: 28,
                                        decoration: TextDecoration.none,
                                        foreground: Paint()..shader = gradient),
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
                            );
                          })),
                  const SizedBox(
                    width: 20,
                  ),
                  if (MediaQuery.of(context).size.width > 1280)
                    Image(
                      height: MediaQuery.of(context).size.height / 1.1,
                      fit: BoxFit.contain,
                      image: const AssetImage(
                          '../Assets/Backgrounds_Phone/background_8.png'),
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