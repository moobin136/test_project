import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  // Required properties
  final String text;

  // Text styling
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;

  // Alignment & Layout
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextOverflow? overflow;
  final int? maxLines;

  // Decoration
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;

  // Advanced / Shadow
  final List<Shadow>? shadows;
  final StrutStyle? strutStyle;
  final TextBaseline? textBaseline;
  final TextWidthBasis? textWidthBasis;

  // Responsive scaling factor (optional)
  final double? scaleFactor; // extra control over responsiveness

  const CustomText({
    super.key,
    required this.text,

    // Default styling values
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black87,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.height = 1.2,

    // Layout defaults
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.maxLines,

    // Decoration defaults
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,

    // Advanced
    this.shadows,
    this.strutStyle,
    this.textBaseline,
    this.textWidthBasis,

    // Responsive
    this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive font size calculation
    final double screenWidth = MediaQuery.of(context).size.width;
    final double baseScale = screenWidth / 375.0;

    final double responsiveFontSize = (fontSize ?? 16.0) * baseScale * (scaleFactor ?? 1.0);

    return Text(
      text,
      style: TextStyle(
        fontSize: responsiveFontSize,
        fontWeight: fontWeight,
        color: color,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        shadows: shadows,
      ),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textWidthBasis: textWidthBasis,
      // textBaseline: textBaseline ?? TextBaseline.alphabetic,
    );
  }
}
