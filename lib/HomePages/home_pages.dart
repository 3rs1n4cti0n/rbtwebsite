import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-400,
      height: double.infinity,
      child: PageView(
        children: [
          Container(color: Colors.red,),
          Container(color: Colors.blue,),
          Container(color: Colors.green,),
        ],
      ),
    );
  }
}
