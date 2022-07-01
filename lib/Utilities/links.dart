import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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