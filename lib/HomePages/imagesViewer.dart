import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final Size currentSize;
  final double maxHeight;
  final double maxWidth;

  const ImageViewer({
    Key? key,
    required this.currentSize,
    this.maxHeight = 500.0,
    this.maxWidth = 800.0,
  }) : super(key: key);

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer>
    with TickerProviderStateMixin {
  late PageController controller;
  late TabController tabController;
  @override
  void initState() {
    controller = PageController(viewportFraction: 1);
    tabController = TabController(length: 7, vsync: this);
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
                            width: widget.currentSize.width,
                            height: widget.currentSize.height - 50,
                            constraints: BoxConstraints(
                                maxHeight: widget.currentSize.height - 50,
                                maxWidth: widget.currentSize.width),
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
                      height: widget.maxHeight,
                      width: widget.maxWidth,
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
}
