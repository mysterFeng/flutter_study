import 'package:flutter/material.dart';

class MyGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final double fontSize;
  final List<Color> gradientColors;
  final Color? backgroundColor;
  final Color textColor;
  final Color splashColor;
  final double borderWidth;
  final Color borderColor;
  final bool disabled;
  final bool autoWidthHeight;
  final EdgeInsetsGeometry textPadding;

  const MyGradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = 100,
    this.height = 40,
    this.borderRadius = 20,
    this.fontSize = 14,
    this.gradientColors = const [Color(0xFF7D70FE), Color(0xFF7347ED)],
    this.textColor = Colors.white,
    this.splashColor = Colors.transparent,
    this.disabled = false,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.autoWidthHeight = false,
    this.textPadding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: autoWidthHeight ? null : width,
      height: autoWidthHeight ? null : height,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: disabled ? null : onPressed,
          splashColor: splashColor,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: (backgroundColor == null)
                  ? LinearGradient(
                colors: gradientColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
                  : null,
              color: backgroundColor,
              border: (borderWidth > 0)
                  ? Border.all(
                color: borderColor,
                width: borderWidth,
              )
                  : null,
            ),
            padding: textPadding,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: disabled ? Colors.grey : textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
