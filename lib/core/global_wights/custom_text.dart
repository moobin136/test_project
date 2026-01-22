
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double letterSpacing;
  final double wordSpacing;
  final double height;
  final TextDecoration decoration;
  final Color? backgroundColor;
  final TextOverflow overflow;
  final int? maxLines;
  final bool softWrap;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final List<Shadow>? shadows;
  final Paint? foreground;
  final Paint? background;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 20.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0.0,
    this.wordSpacing = 0.0,
    this.height = 1.0,
    this.decoration = TextDecoration.none,
    this.backgroundColor,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.softWrap = true,
    this.textAlign = TextAlign.left,
    this.fontStyle = FontStyle.normal,
    this.shadows,
    this.foreground,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        decoration: decoration,
        backgroundColor: backgroundColor,
        fontStyle: fontStyle,
        shadows: shadows,
        foreground: foreground,
        background: background,
      ),
    );
  }
}

// import 'package:flutter/widgets.dart';

// class CustomText extends StatelessWidget {
//   const CustomText(
//       {super.key,
//       required this.text,
//       required this.fontSize,
//       required this.fontWeight,
//       required this.color,
//       required this.textAlign});
//   final String text;
//   final double? fontSize;
//   final FontWeight? fontWeight;
//   final Color? color;
//   final TextAlign? textAlign;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       '',
//       style: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
// }
