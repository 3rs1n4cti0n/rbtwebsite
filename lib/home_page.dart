import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitality/models/ItemBehaviour.dart';
import 'package:vitality/models/WhenOutOfScreenMode.dart';
import 'package:vitality/vitality.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late PageController controller;
  late TabController tabController;
  late ScrollController listAnimationController;
  final initWidth = 0.0;
  final initHeight = 0.0;
  final maxHeight = 500.0;
  final maxWidth = 800.0;
  late Size currentSize;
  late final Shader gradient;
  List<Widget> pageWidgets = [];
  late final Map<String, String> servicesMap = <String, String>{};

  @override
  void initState() {
    controller = PageController(viewportFraction: 1);
    currentSize = Size(maxWidth, maxHeight);
    tabController = TabController(length: 7, vsync: this);
    listAnimationController = ScrollController();
    gradient = LinearGradient(
            colors: [Colors.cyan[900]!, Colors.orange[900]!, Colors.cyan[900]!])
        .createShader(const Rect.fromLTWH(0.0, 0.0, 400.0, 70.0));
    initServices();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    tabController.dispose();
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
              webAppBar(),
              services(),
              pageViewImages(),
              logoDisplay(),
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

  Widget logoDisplay() {
    return Container(
      color: Colors.grey[200]!.withOpacity(0.7),
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width / 1.25,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                "LOGOS",
                style: TextStyle(
                    fontSize: 36,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, bottom: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            child: Container(
                              color: Colors.white,
                              constraints: const BoxConstraints(
                                  maxHeight: 500, maxWidth: 500),
                              child: Image.asset(
                                '../Assets/logos/logo.png',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: const Text(
                            "Logo for a Board Game Group.",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                decoration: TextDecoration.none),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            constraints: const BoxConstraints(
                                maxHeight: 500, maxWidth: 500),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: Image.asset(
                                '../Assets/logos/logo2.png',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: const Text(
                            "Logo for a friends' website.",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                decoration: TextDecoration.none),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget services() {
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

  Widget webAppBar() {
    return Container(
      color: Colors.blueGrey[900],
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Stack(fit: StackFit.expand, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 10),
                  ]),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(100),
                      child: Image.asset('Assets/profile_pic.jpg'),
                    ),
                  )),
              const SizedBox(
                width: 50,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Ersan Tzampaz Chatip",
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                decoration: TextDecoration.none,
                                fontSize: 32),
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: const Text(
                            "I was born in Greece and currently studying in Eskişehir, Turkey. I'm majoring in Computer Engineering and love designing and drawing. I'm passionate about coding and love learning new things.",
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontSize: 16),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 800,
                      ),
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      children: const [
                        Links(
                          name: "Github",
                          link: "https://github.com/3rs1n4cti0n",
                        ),
                        Links(
                          name: "LinkedIn",
                          link:
                              "https://www.linkedin.com/in/ErsanTzampazChatip",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget pageViewImages() {
    return Material(
      color: Colors.white.withOpacity(0.7),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width / 1.25,
        child: Column(
          children: [
            const Center(
              child: Text(
                "BACKGROUND IMAGES",
                style: TextStyle(fontSize: 36, color: Colors.black),
              ),
            ),
            Flexible(
              child: Stack(children: [
                PageView.builder(
                  controller: controller,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Center(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Container(
                            width: currentSize.width,
                            height: currentSize.height - 50,
                            constraints: BoxConstraints(
                                maxHeight: currentSize.height - 50,
                                maxWidth: currentSize.width),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 10,
                                  )
                                ],
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      "Assets/Backgrounds/background_${index + 1}.png"),
                                ))),
                      ),
                    );
                  },
                ),
                Material(
                  color: Colors.transparent,
                  child: Center(
                    child: SizedBox(
                      height: maxHeight,
                      width: maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                child: IconButton(
                                    highlightColor: Colors.orangeAccent[100]
                                        ?.withOpacity(0.5),
                                    hoverColor: Colors.orangeAccent[100]
                                        ?.withOpacity(0.5),
                                    splashColor:
                                        Colors.orangeAccent.withOpacity(0.5),
                                    onPressed: () {
                                      controller.animateToPage(
                                          (controller.page! - 1)
                                              .round()
                                              .clamp(0, 6),
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.fastOutSlowIn);
                                      tabController.animateTo(
                                          (controller.page! - 1)
                                              .round()
                                              .clamp(0, 6));
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.orangeAccent[100],
                                    )),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              child: IconButton(
                                  highlightColor: Colors.orangeAccent[100]
                                      ?.withOpacity(0.5),
                                  hoverColor: Colors.orangeAccent[100]
                                      ?.withOpacity(0.5),
                                  splashColor:
                                      Colors.orangeAccent.withOpacity(0.5),
                                  onPressed: () {
                                    controller.animateToPage(
                                        (controller.page! + 1)
                                            .round()
                                            .clamp(0, 6),
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.fastOutSlowIn);
                                    tabController.animateTo(
                                        (controller.page! + 1)
                                            .round()
                                            .clamp(0, 6));
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.orangeAccent[100],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            TabPageSelector(
              color: Colors.black.withOpacity(0.5),
              borderStyle: BorderStyle.none,
              controller: tabController,
              selectedColor: Colors.orangeAccent,
            )
          ],
        ),
      ),
    );
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
}

class Links extends StatelessWidget {
  final String name;
  final String link;
  const Links({
    Key? key,
    required this.name,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (() {
          launchUrl(Uri.parse(link));
        }),
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.orangeAccent,
              decoration: TextDecoration.none,
              fontSize: 12),
        ),
      ),
    );
  }
}
