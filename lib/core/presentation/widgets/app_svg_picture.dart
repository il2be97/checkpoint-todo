import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgPicture extends StatelessWidget {
  const AppSvgPicture(
    this.assetName, {
    super.key,
    this.color,
    this.height,
    this.width,
  });

  final String assetName;

  final Color? color;

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      colorFilter: color != null ? ColorFilter.mode(color!, .srcIn) : null,
    );
  }
}
