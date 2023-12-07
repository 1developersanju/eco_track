import 'package:flutter/material.dart';

class TextStyles {
  static const double headingSize = 24.0;
  static const double subHeadingSize = 20.0;
  static const double normalTextSize = 16.0;
  static const double smallTextSize = 14.0;

  static const TextStyle heading = TextStyle(
    fontSize: headingSize,
    fontWeight: FontWeight.bold,
    // Other properties like color, letterSpacing, etxc. can be added here
  );
  static const TextStyle electricity = TextStyle(
      fontSize: headingSize, fontWeight: FontWeight.bold, color: Colors.teal
      // Other properties like color, letterSpacin g, etxc. can be added here
      );
  static const TextStyle water = TextStyle(
      fontSize: headingSize, fontWeight: FontWeight.bold, color: Colors.blue
      // Other properties like color, letterSpacin g, etxc. can be added here
      );

  static const TextStyle subHeading = TextStyle(
    fontSize: subHeadingSize,
    fontWeight: FontWeight.bold,
    // Other properties like color, letterSpacing, etc. can be added here
  );

  static const TextStyle normalText = TextStyle(
    fontSize: normalTextSize,
    // Other properties like color, letterSpacing, etc. can be added here
  );

  static const TextStyle smallText = TextStyle(
    fontSize: smallTextSize,
    // Other properties like color, letterSpacing, etc. can be added here
  );
}

class ColorConstants {
  static const Color white = Colors.white;
  static const Color teal = Colors.teal;
  static const Color blue = Colors.blue;
}
