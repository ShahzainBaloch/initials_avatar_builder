import 'package:flutter/material.dart';

class InitialsAvatar extends StatelessWidget {
  final String name;
  final double radius;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final Color textColor;
  final double? fontSize;

  const InitialsAvatar({
    Key? key,
    required this.name,
    this.radius = 24.0,
    this.backgroundColor,
    this.backgroundGradient,
    this.textColor = Colors.white,
    this.fontSize,
  }) : super(key: key);

  String _getInitials(String name) {
    if (name.trim().isEmpty) return "?";
    
    List<String> words = name.trim().split(RegExp(r'\s+'));
    
    if (words.length == 1) {
      return words[0][0].toUpperCase();
    }
    
    return "${words[0][0]}${words[1][0]}".toUpperCase();
  }

  Color _getAvatarColor(String name) {
    final List<Color> colors = [
      Colors.red, Colors.blue, Colors.green, Colors.orange,
      Colors.purple, Colors.teal, Colors.pink, Colors.indigo,
    ];
    int hash = name.hashCode;
    return colors[hash.abs() % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final initials = _getInitials(name);
    
    final defaultFontSize = initials.length == 1 ? (radius * 0.9) : (radius * 0.8);

    Color? finalColor = backgroundColor;
    Gradient? finalGradient = backgroundGradient;

    // Agar dono null hain, toh default auto color assign hoga
    if (finalColor == null && finalGradient == null) {
      finalColor = _getAvatarColor(name);
    }

    // BoxDecoration mein gradient aur color dono ek sath nahi lag saktay,
    // isliye agar user ne gradient diya hai toh usay prioritize karein aur color null kar dein.
    if (finalGradient != null) {
      finalColor = null;
    }

    final boxDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: finalColor,
      gradient: finalGradient,
    );

    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: boxDecoration,
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize ?? defaultFontSize,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}