import 'package:flutter/material.dart';

class StackBox extends StatelessWidget {
  final double secondTop;
  final double firstHeight;
  final double secondHeight;
  final Color color;
  final Widget? firstchild;
  final Widget secondchild;

  const StackBox(
      {super.key,
      required this.firstHeight,
      required this.color,
      required this.secondTop,
      required this.secondHeight,
      this.firstchild,
      required this.secondchild});

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.of(context);
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            width: mySize.size.width * 1,
            height: firstHeight,
            color: color,
            child: firstchild != null ? firstchild : SizedBox(),
          ),
        ),
        Positioned(
          top: secondTop,
          child: Container(
            width: mySize.size.width * 1,
            height: secondHeight,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: secondchild,
          ),
        ),
      ],
    );
  }
}
