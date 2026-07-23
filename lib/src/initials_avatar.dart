import 'package:flutter/material.dart';

/// A widget that displays a circular avatar with initials extracted from a given name.
/// 
/// It automatically generates a consistent background color based on the name,
/// or allows customization via [backgroundColor] or [backgroundGradient].
class InitialsAvatar extends StatelessWidget {
  /// The full name from which initials will be extracted.
  /// 
  /// For example, "John Doe" will produce "JD". "Alice" will produce "A".
  final String name;

  /// The radius of the circular avatar.
  /// 
  /// Defaults to 24.0.
  final double radius;

  /// A solid background color for the avatar.
  /// 
  /// If neither [backgroundColor] nor [backgroundGradient] are provided, a 
  /// default color is automatically generated based on the [name]'s hash.
  final Color? backgroundColor;

  /// A gradient background for the avatar.
  /// 
  /// If provided, this takes precedence over the default generated color.
  final Gradient? backgroundGradient;

  /// The color of the initials text.
  /// 
  /// Defaults to [Colors.white].
  final Color textColor;

  /// The font size of the initials text.
  /// 
  /// If null, it automatically scales based on the [radius] and the number of initials.
  final double? fontSize;

  /// Creates an [InitialsAvatar].
  /// 
  /// The [name] parameter is required to generate the initials.
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