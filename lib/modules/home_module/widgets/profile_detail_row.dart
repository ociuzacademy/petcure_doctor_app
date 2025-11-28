import 'package:flutter/material.dart';

class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final bool expandText;
  final Widget? trailing;

  const ProfileDetailRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
    this.expandText = false,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5),
        if (expandText)
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16)))
        else
          Text(text, style: const TextStyle(fontSize: 16)),
        if (trailing != null) ...[const Spacer(), trailing!],
      ],
    );
  }
}
