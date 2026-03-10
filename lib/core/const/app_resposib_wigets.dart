import 'package:flutter/material.dart';
import 'package:test_project/core/const/app_advance_size.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveBuilder({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.init(context);

        if (SizeConfig.isDesktop && desktop != null) {
          return desktop!;
        } else if (SizeConfig.isTablet && tablet != null) {
          return tablet!;
        } else {
          return mobile;
        }
      },
    );
  }
}

/// Orientation Builder - Portrait/Landscape অনুযায়ী different UI
class OrientationBuilder extends StatelessWidget {
  final Widget portrait;
  final Widget? landscape;

  const OrientationBuilder({
    Key? key,
    required this.portrait,
    this.landscape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.init(context);

        if (SizeConfig.isLandscape && landscape != null) {
          return landscape!;
        } else {
          return portrait;
        }
      },
    );
  }
}

/// Responsive Container - Automatically responsive
class ResponsiveContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Decoration? decoration;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;

  const ResponsiveContainer({
    Key? key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.decoration,
    this.child,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.w,
      height: height?.h,
      padding: padding,
      margin: margin,
      decoration: decoration ??
          (color != null || borderRadius != null
              ? BoxDecoration(
                  color: color,
                  borderRadius: borderRadius,
                )
              : null),
      child: child,
    );
  }
}

/// Responsive Text
class ResponsiveText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const ResponsiveText(
    this.text, {
    Key? key,
    required this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

/// Responsive Grid View
class ResponsiveGridView extends StatelessWidget {
  final List<Widget> children;
  final int mobileColumns;
  final int tabletColumns;
  final int desktopColumns;
  final double spacing;
  final EdgeInsetsGeometry? padding;

  const ResponsiveGridView({
    Key? key,
    required this.children,
    this.mobileColumns = 2,
    this.tabletColumns = 3,
    this.desktopColumns = 4,
    this.spacing = 16.0,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.init(context);

        int columns = SizeConfig.getCrossAxisCount(
          mobile: mobileColumns,
          tablet: tabletColumns,
          desktop: desktopColumns,
        );

        return GridView.count(
          crossAxisCount: columns,
          crossAxisSpacing: spacing.r,
          mainAxisSpacing: spacing.r,
          padding: padding ?? EdgeInsets.all(spacing.r),
          children: children,
        );
      },
    );
  }
}

/// Responsive Padding
class ResponsivePadding extends StatelessWidget {
  final Widget child;
  final double? all;
  final double? horizontal;
  final double? vertical;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;

  const ResponsivePadding({
    Key? key,
    required this.child,
    this.all,
    this.horizontal,
    this.vertical,
    this.left,
    this.right,
    this.top,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: (left ?? horizontal ?? all ?? 0).r,
        right: (right ?? horizontal ?? all ?? 0).r,
        top: (top ?? vertical ?? all ?? 0).r,
        bottom: (bottom ?? vertical ?? all ?? 0).r,
      ),
      child: child,
    );
  }
}

/// Show different widgets based on device
Widget showByDevice({
  required Widget mobile,
  Widget? tablet,
  Widget? desktop,
}) {
  return ResponsiveBuilder(
    mobile: mobile,
    tablet: tablet,
    desktop: desktop,
  );
}

/// Show different widgets based on orientation
Widget showByOrientation({
  required Widget portrait,
  Widget? landscape,
}) {
  return OrientationBuilder(
    portrait: portrait,
    landscape: landscape,
  );
}
