import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../util/assets_path.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenSiz = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        SvgPicture.asset(
          AssetsPath.bgSVG,
          fit: BoxFit.cover,
          height: screenSiz.height,
          width: screenSiz.width,
        ),
        SafeArea(child: child)
      ],
    );
  }
}
