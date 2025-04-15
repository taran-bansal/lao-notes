import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LNIcon extends StatelessWidget {
  const LNIcon({
    required this.path,
    this.onTap,
    this.size,
    this.color,
    super.key,
  });

  final String path;
  final Function()? onTap;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onTap,
        child: Padding(
          padding: onTap != null
              ? const EdgeInsets.all(8.0)
              : EdgeInsets.zero,
          child: SvgPicture.asset(
            path,
            height: size,
            width: size,
            colorFilter: color != null
                ? ColorFilter.mode(color!, BlendMode.srcIn)
                : null,
          ),
        ),
      ),
    );
  }
}
