import 'package:flutter/material.dart';
import 'package:rbtwebsite/Utilities/index_pages.dart';
import '../Utilities/navbar_button.dart';

class HomePageNavigatorBar extends StatefulWidget {
  HomePageNavigatorBar({Key? key, required this.notifyParent}) : super(key: key);

  final Function(int) notifyParent;

  @override
  State<HomePageNavigatorBar> createState() => _HomePageNavigationState();
}

class _HomePageNavigationState extends State<HomePageNavigatorBar> {
  SelectedIndex selectedIndex = SelectedIndex();

  _HomePageNavigationState();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: SelectedIndex.selectedIndex,
      builder: (context, value, child) {
        return Container(
          width: 400,
          height: double.infinity,
          color: const Color.fromARGB(255, 17, 19, 26),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: FittedBox(
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 120,
                        minRadius: 60)),
              ),
              NavigationButton(
                name: "About me",
                index: 0,
                notifyParentOnIndexChange: widget.notifyParent,
              ),
              const Flexible(
                  child: SizedBox(
                height: 3,
              )),
              NavigationButton(
                name: "Services",
                index: 1,
                notifyParentOnIndexChange: widget.notifyParent,
              ),
              const Flexible(
                  child: SizedBox(
                height: 3,
              )),
              NavigationButton(
                name: "Tools",
                index: 2,
                notifyParentOnIndexChange: widget.notifyParent,
              ),
              const Flexible(
                  child: SizedBox(
                height: 3,
              )),
              NavigationButton(
                name: "Projects",
                index: 3,
                notifyParentOnIndexChange: widget.notifyParent,
              ),
              const Flexible(
                  child: SizedBox(
                height: 3,
              )),
              NavigationButton(
                name: "Contact Me",
                index: 4,
                notifyParentOnIndexChange: widget.notifyParent,
              ),
            ],
          ),
        );
      },
    );
  }
}
