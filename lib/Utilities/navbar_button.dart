import 'package:flutter/material.dart';
import 'package:rbtwebsite/Utilities/index_pages.dart';
import 'package:rbtwebsite/HomePages/home_pages.dart';

class NavigationButton extends StatefulWidget {
  NavigationButton({
    Key? key,
    required this.name, required this.index, required this.notifyParentOnIndexChange,
  }) : super(key: key);

  final String name;
  final Color selectedColor = const Color.fromARGB(255, 67, 73, 98);
  final Color idleColor = const Color.fromARGB(255, 44, 48, 65);
  final int index;
  final Function(int) notifyParentOnIndexChange;

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: SelectedIndex.selectedIndex.value == widget.index ? widget.selectedColor : widget.idleColor,
      child: TextButton(
        style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.red[900]!.withOpacity(0.2)),),
        onPressed: () {
          SelectedIndex.selectedIndex.value = widget.index;
          widget.notifyParentOnIndexChange(widget.index);
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
