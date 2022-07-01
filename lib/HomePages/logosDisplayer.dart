import 'package:flutter/material.dart';

class LogosDisplayer extends StatefulWidget {
  const LogosDisplayer({Key? key}) : super(key: key);

  @override
  State<LogosDisplayer> createState() => _LogosDisplayerState();
}

class _LogosDisplayerState extends State<LogosDisplayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200]!.withOpacity(0.7),
      height: MediaQuery.of(context).size.height / 1.25,
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50, bottom: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        const Flexible(
                            child: SizedBox(
                          height: 10,
                        )),
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
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        const Flexible(
                            child: SizedBox(
                          height: 10,
                        )),
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
}
