import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final String title;
  final Color color;
  final Function() onPressed;
  const MenuButton(
      {super.key,
      required this.title,
      this.color = Colors.grey,
      required this.onPressed});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  var borderRadius = BorderRadius.circular(3);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: borderRadius,
        color: widget.color,
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: borderRadius,
          child: Container(
            width: 400,
            height: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: borderRadius),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
