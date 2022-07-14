// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rbtwebsite/UtilitiesOld/links.dart';

class HomePageBar extends StatefulWidget {
  const HomePageBar({Key? key}) : super(key: key);

  @override
  State<HomePageBar> createState() => _HomePageBarState();
}

class _HomePageBarState extends State<HomePageBar> {
  @override
  Widget build(BuildContext context) {
    const biography = "I was born in Greece and currently studying in Eskişehir, Turkey. I'm majoring in Computer Engineering and love designing and drawing. I'm passionate about coding and love learning new things. I have a strong and quick imagination that helps me build UI, database and designs in my head!";
    
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
                            biography,
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
}