import 'package:flutter/material.dart';

class SettingsTile extends StatefulWidget {
  const SettingsTile({
    required this.leading,
    required this.title,
    this.trailing,
    this.displayLanguage,
    required this.showSwitch,
    this.switchValue = false,
    this.onSwitchValueChanged,
    super.key,
  });

  final IconData leading;
  final String title;
  final IconData? trailing;
  final bool showSwitch;
  final bool? switchValue;
  final String? displayLanguage;
  final void Function(bool)? onSwitchValueChanged;

  @override
  State<SettingsTile> createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(widget.leading),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          widget.displayLanguage != null
              ? Text(
                  widget.displayLanguage!,
                  style: TextStyle(color: Colors.grey),
                )
              : const SizedBox.shrink(),
          // Text(widget.displayLanguage,style: TextStyle(color: Colors.grey),), if condition use...
          if (widget.showSwitch) ...{
            // Switch widget
            Switch(
                value: widget.switchValue!,
                activeColor: Colors.black,
                onChanged: widget.onSwitchValueChanged,
            )
          } else ...{
            // Icon Widget
            Icon(
              widget.trailing,
              size: 20,
            ),
          }
        ],
      ),
    );
  }
}
