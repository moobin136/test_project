import 'package:flutter/material.dart';
import 'package:test_project/core/constant/app_colors.dart';

class CustomContainerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  // Container এর প্রপার্টি
  final double? width;
  final double? height;
  final Color color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final Color borderColor;
  final double borderWidth;

  // Text এর প্রপার্টি (CustomText এর মতো)
  final TextStyle? textStyle;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;
  final double heightMultiplier;
  final TextAlign textAlign;

  // Icon প্রপার্টি (ঐচ্ছিক)
  final IconData? icon;
  final double iconSize;
  final Color iconColor;
  final bool iconOnLeft;
  final double iconSpacing;

  // State প্রপার্টি
  final bool isLoading;
  final Color loadingColor;
  final double loadingSize;

  const CustomContainerButton({
    super.key,
    required this.text,
    required this.onPressed,

    // Container
    this.width,
    this.height = 48.0,
    this.color = AppColors.primary,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    this.margin = EdgeInsets.zero,
    this.borderRadius = 12.0,
    this.boxShadow,
    this.gradient,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,

    // Text
    this.textStyle,
    this.fontSize = 16.0,
    this.textColor = AppColors.textPrimary,
    this.fontWeight = FontWeight.w600,
    this.letterSpacing = 0.0,
    this.heightMultiplier = 1.0,
    this.textAlign = TextAlign.center,

    // Icon
    this.icon,
    this.iconSize = 20.0,
    this.iconColor = Colors.white,
    this.iconOnLeft = true,
    this.iconSpacing = 8.0,

    // State
    this.isLoading = false,
    this.loadingColor = Colors.white,
    this.loadingSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: gradient != null ? null : color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderWidth > 0
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        boxShadow: boxShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            padding: padding,
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: loadingSize,
                      height: loadingSize,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation(loadingColor),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null && iconOnLeft) ...[
                          Icon(
                            icon,
                            size: iconSize,
                            color: iconColor,
                          ),
                          SizedBox(width: iconSpacing),
                        ],
                        Text(
                          text,
                          textAlign: textAlign,
                          style: textStyle ??
                              TextStyle(
                                fontSize: fontSize,
                                color: textColor,
                                fontWeight: fontWeight,
                                letterSpacing: letterSpacing,
                                height: heightMultiplier,
                              ),
                        ),
                        if (icon != null && !iconOnLeft) ...[
                          SizedBox(width: iconSpacing),
                          Icon(
                            icon,
                            size: iconSize,
                            color: iconColor,
                          ),
                        ],
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
