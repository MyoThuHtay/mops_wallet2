import 'package:flutter/material.dart';

import 'dimensions.dart';

class TextIcon extends StatelessWidget {
  final IconData icon;
 final String text;
 final Color? conColor;
 final Color? iconColor;
 final double? iconSize;
 final Color? textColor;
 final VoidCallback? onTap;

  const TextIcon({Key? key,
    required this.icon,
    required this.text,
    this.conColor = const Color(0xFF255090),
    this.iconColor = const Color(0xFF255090),
    this.textColor = const Color(0xFFFFFFFF),
    this.iconSize = 24,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.blue,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(100),
            color:conColor, // Creates border
          ),
          child: IconButton(
              onPressed: onTap,
              icon: Icon(icon),
              //icon: const Icon(CupertinoIcons.doc_on_doc),
              iconSize: iconSize!,
              color: iconColor),
        ),
        Text(
          text,
          style:
          TextStyle(fontSize: Dimensions.font14, color: textColor),
        ),
      ],
    );
  }
}
