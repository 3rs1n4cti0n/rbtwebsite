import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AnimatedTechnologies extends StatefulWidget {
  late final String image;
  late final double percentAmount;
  late final Color? progressColorFin;
  AnimatedTechnologies({Key? key,required String path, required double percent, required Color? progressColor}) : super(key: key){
    image = path;
    percentAmount = percent;
    progressColorFin = progressColor;
  }
  
  @override
  State<AnimatedTechnologies> createState() => _AnimatedTechnologiesState();
}

class _AnimatedTechnologiesState extends State<AnimatedTechnologies> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      backgroundColor: Colors.grey.withOpacity(0.2),
      progressColor: widget.progressColorFin,
      radius: 95,
      lineWidth: 20,
      animation: true,
      animationDuration: 500,
      reverse: true,
      center: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(0.4),
        foregroundColor: Colors.transparent,
        minRadius: 30,
        maxRadius: 70,
        foregroundImage: Image.asset(
                widget.image, isAntiAlias: true,filterQuality: FilterQuality.high,
              ).image,
      ),
      percent: widget.percentAmount,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
