import 'package:flutter/material.dart';

class HomePageNavigatorBar extends StatefulWidget {
  HomePageNavigatorBar({Key? key}) : super(key: key);

  @override
  State<HomePageNavigatorBar> createState() => _HomePageNavigationState();
}

class SelectedIndex{
  static int selectedIndex = 0; 
  static void changeIndex(int newIndex){
    selectedIndex = newIndex;
  }
  static int getIndex(){
    return selectedIndex;
  }
}

class _HomePageNavigationState extends State<HomePageNavigatorBar> {
  SelectedIndex selectedIndex = SelectedIndex();

  void _onIndexChange(){
    setState(() {
    });
  }

  _HomePageNavigationState();
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
            updateParent: _onIndexChange,
          ),
          const Flexible(
              child: SizedBox(
            height: 3,
          )),
          NavigationButton(
            name: "Services",
            index: 1,
            updateParent: _onIndexChange,
          ),
          const Flexible(
              child: SizedBox(
            height: 3,
          )),
          NavigationButton(
            name: "Tools",
            index: 2,
            updateParent: _onIndexChange,
          ),
          const Flexible(
              child: SizedBox(
            height: 3,
          )),
          NavigationButton(
            name: "Projects",
            index: 3,
            updateParent: _onIndexChange,
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatefulWidget {
  NavigationButton({
    Key? key,
    required this.name, required this.index, required this.updateParent,
  }) : super(key: key);

  final String name;
  Color selectedColor = const Color.fromARGB(255, 67, 73, 98);
  Color idleColor = const Color.fromARGB(255, 44, 48, 65);
  final int index;
  final VoidCallback updateParent;

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: SelectedIndex.getIndex() == widget.index ? widget.selectedColor : widget.idleColor,
      child: TextButton(
        style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.red[900]!.withOpacity(0.2)),),
        onPressed: () {
          SelectedIndex.changeIndex(widget.index);
          widget.updateParent();
        },
        child: Center(
            child: Text(
          widget.name,
          style: const TextStyle(color: Colors.white, fontSize: 36),
        )),
      ),
    );
  }
}
