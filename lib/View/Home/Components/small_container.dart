import 'package:flutter/material.dart';

class SmallContainer extends StatefulWidget {
  final String text;
  final String image;
  final Color textColor;
  final Color backgroundColor;

  SmallContainer({
    super.key,
    required this.text,
    required this.image,
    required this.textColor,
    Color? backgroundColor,
  }) : backgroundColor = backgroundColor ?? Colors.black.withOpacity(0.5), super();

  @override
  State<SmallContainer> createState() => _SmallContainerState();
}

class _SmallContainerState extends State<SmallContainer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          height: size.width * 0.2,
          width: size.width * 0.2,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            widget.image,
            height: 40,
            width: 40,
          )
        ),
        const SizedBox(height: 4),
        Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor,
            fontSize: 12
          ),
        )
      ],
    );
  }
}