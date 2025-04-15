import 'package:first_project/ui_kit/button/type.dart';
import 'package:flutter/material.dart';

class LNButton extends StatelessWidget {
  const LNButton({
    required this.text,
    this.type = ButtonType.normal,
    this.iconData,
    this.width,
    this.onTap,
    super.key,
  }) : assert(!(type == ButtonType.normal && iconData != null), "Normal buttons can not have icons");

  final String text;
  final Function()? onTap;
  final ButtonType type;
  final IconData? iconData;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(),
      width: width ?? double.maxFinite,
      decoration: getDecoration(),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(getBorderRadius()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null)
                Icon(
                  iconData,
                  size: 30,
                ),
              Text(
                text,
                style: getTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double getHeight() {
    switch (type) {
      case ButtonType.normal:
        return 60;

      case ButtonType.outline:
        return 50;
    }
  }

  Decoration getDecoration() {
    switch (type) {
      case ButtonType.normal:
        return BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(getBorderRadius()),
        );

      case ButtonType.outline:
        return BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(getBorderRadius()),
        );
    }
  }

  double getBorderRadius() {
    return 30;
  }

  TextStyle getTextStyle() {
    switch (type) {
      case ButtonType.normal:
        return const TextStyle(
          color: Colors.white,
          fontSize: 20,
        );

      case ButtonType.outline:
        return const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        );
    }
  }
}
