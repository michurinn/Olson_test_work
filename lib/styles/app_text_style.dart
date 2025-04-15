import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  // systemLinks Text Style
  static final TextStyle actionS = GoogleFonts.onest(
    fontSize: 12, // 12px font size
    fontWeight: FontWeight.w500, // 500 font weight
    height: 15.3 / 12, // line-height: 15.3px relative to font size
    letterSpacing: -0.01 * 12, // letter-spacing: -0.01em (in logical pixels)
  );

  // systemLinks Text Style
  static final TextStyle actionM = GoogleFonts.onest(
    fontSize: 14, // 14px font size
    fontWeight: FontWeight.w500, // 500 font weight
    height: 17.85 / 14, // line-height: 17.85px relative to font size
    letterSpacing: -0.01 * 14, // letter-spacing: -0.01em (in logical pixels)
  );

  // systemLinks Text Style
  static final TextStyle actionL = GoogleFonts.onest(
    fontSize: 15.0, // Font size in logical pixels
    fontWeight: FontWeight.w600, // Semi-bold font weight
    height: 19.13 / 15.0, // Line height ratio (19.13px / 15px font size)
    letterSpacing: -0.01 * 15.0, // Negative letter spacing (-0.01em in pixels)
    textBaseline: TextBaseline.alphabetic, // Ensures proper alignment
    decoration: TextDecoration.none, // No underline decoration
    decorationStyle: TextDecorationStyle.solid,
  );

  // title1 Text Style
  static final TextStyle title1 = GoogleFonts.onest(
    fontSize: 24,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.2, // 67.2px
  );

  static const TextStyle titleH1 = TextStyle(
    fontSize: 20.0, // Font size in logical pixels
    fontWeight: FontWeight.w600, // Semi-bold font weight
    height:
        24.0 / 20.0, // Line height ratio (24px line height / 20px font size)
    letterSpacing:
        -0.005 * 20.0, // Negative letter spacing (-0.005em in pixels)
    textBaseline: TextBaseline.alphabetic, // Ensures proper alignment
    decoration: TextDecoration.none, // No underline decoration
    decorationStyle: TextDecorationStyle.solid,
  );

  static const TextStyle titleH2 = TextStyle(
    fontSize: 18.0, // Font size in logical pixels
    fontWeight: FontWeight.w600, // Semi-bold font weight
    height: 22.95 / 18.0, // Line height ratio (22.95px / 18px font size)
    letterSpacing:
        -0.005 * 18.0, // Negative letter spacing (-0.005em converted to pixels)
    textBaseline: TextBaseline.alphabetic, // Ensures proper alignment
    decoration: TextDecoration.none, // No underline decoration
    decorationStyle: TextDecorationStyle.solid, // Solid decoration style
  );

  // title2 Text Style
  static final TextStyle title2 = GoogleFonts.onest(
    fontSize: 18,
    fontWeight: FontWeight.w600, // medium
    height: 1.2, // 57.6px
  );

  // title3 Text Style
  static final TextStyle title3 = GoogleFonts.onest(
    fontSize: 16, // 16px font size
    fontWeight: FontWeight.w600, // 600 font weight
    height: 20.4 / 16, // line-height: 20.4px relative to font size
    letterSpacing: -0.005 * 16, // letter-spacing: -0.005em (in logical pixels)
  );

  // title3 Text Style
  static final TextStyle title3Regular = GoogleFonts.onest(
    fontSize: 20,
    fontWeight: FontWeight.w400, // semi bold
    height: 1.2, // 48px
  );

  // title4 Text Style
  static final TextStyle title4 = GoogleFonts.onest(
    fontSize: 14,
    fontWeight: FontWeight.w600, // semi bold
    height: 17.85 / 14, // line-height: 17.85px relative to font size
    letterSpacing: -0.005 *
        14, // letter-spacing: -0.005em (in Flutter, letter-spacing is in logical pixels)
  );

  // title5 Text Style
  static final TextStyle title5 = GoogleFonts.onest(
    fontSize: 12,
    fontWeight: FontWeight.w600, // semi bold
    //letterSpacing: -0.04,
    height: 1.2, // 39.2px
  );

  // title6 Text Style
  static final TextStyle title6 = GoogleFonts.onest(
    fontSize: 24,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.4, // 33.6px
  );

  // title7 Text Style
  static final TextStyle title7 = GoogleFonts.onest(
    fontSize: 18,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.4, // 25.2px
  );

  // title8 Text Style
  static final TextStyle title8 = GoogleFonts.onest(
    fontSize: 16,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.4, // 22.4px
  );

  // title9 Text Style
  static final TextStyle title9 = GoogleFonts.onest(
    fontSize: 14,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.4, // 19.6px
  );

  // title10 Text Style
  static final TextStyle title10 = GoogleFonts.onest(
    fontSize: 12,
    fontWeight: FontWeight.w500, // medium
    height: 1.2, // 14.4px
  );

  static const TextStyle body13 = TextStyle(
    fontSize: 13.0, // Font size in logical pixels
    fontWeight: FontWeight.w400, // Font weight
    height:
        16.0 / 13.0, // Line height ratio (16px line height / 13px font size)
    textBaseline: TextBaseline.alphabetic, // Ensures proper alignment
    decoration: TextDecoration.none, // No underline decoration by default
    decorationStyle: TextDecorationStyle.solid,
  );

  // body14 Text Style
  static final TextStyle body14 = GoogleFonts.onest(
    fontSize: 14, // 14px font size
    fontWeight: FontWeight.w400, // 400 font weight
    height: 20 / 14, // line-height: 20px relative to font size
    letterSpacing:
        -0.01 * 14, // letter-spacing: -0.01em (relative to font size)
  );

  // body15 Text Style
  static final TextStyle body15 = GoogleFonts.onest(
    fontSize: 15, // font-size: 15px
    fontWeight: FontWeight.w400, // regular
    height: 20 / 15, // line-height: 20px,
  );

  static const TextStyle body16 = TextStyle(
    fontSize: 16.0, // Font size in logical pixels
    fontWeight: FontWeight.w400, // Normal font weight
    height: 22.0 / 16.0, // Line height ratio (22px / 16px font size)
    letterSpacing:
        -0.01 * 16.0, // Negative letter spacing (-0.01em converted to pixels)
    textBaseline: TextBaseline.alphabetic, // Ensures proper alignment
    decoration: TextDecoration.none, // No underline decoration
    decorationStyle: TextDecorationStyle.solid, // Solid decoration style
  );

  // text1 Text Style
  static final TextStyle text1 = GoogleFonts.onest(
    fontSize: 18,
    fontWeight: FontWeight.w400, // regular
    height: 1.6, // 28.8px
  );

  // text2 Text Style
  static final TextStyle text2 = GoogleFonts.onest(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1.4, // 22.4px
  );

  // text3 Text Style
  static final TextStyle text3 = GoogleFonts.onest(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    height: 1.4, // 19.6px
  );

  // text4 Text Style
  static final TextStyle text4 = GoogleFonts.onest(
    fontSize: 12,
    fontWeight: FontWeight.w500, // medium
    height: 1.4, // 16.8px
  );

  // systemTag Text Style
  static final TextStyle systemTag = GoogleFonts.onest(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    height: 1.43, // 20px
  );

  // systemLink Text Style
  static final TextStyle systemLink = GoogleFonts.onest(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    height: 1.5, // 24px
  );

  // systemTooltip Text Style
  static final TextStyle systemTooltip = GoogleFonts.onest(
    fontSize: 14,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.43, // 20px
  );

  // systemLinks Text Style
  static final TextStyle systemLinks = GoogleFonts.onest(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    height: 1.71, // 24px
  );

  // systemButton Text Style
  static final TextStyle systemButton = GoogleFonts.onest(
      fontSize: 14,
      fontWeight: FontWeight.w600, // semi bold
      height: 1.43, // 20px
      backgroundColor: null,
      wordSpacing: null,
      decorationThickness: null);

  // systemDisrciption Text Style
  static final TextStyle systemDisrciption = GoogleFonts.onest(
    fontSize: 14,
    fontWeight: FontWeight.w400, // regular
    height: 1.43, // 20px
  );

  // systemInput Text Style
  static final TextStyle systemInput = GoogleFonts.onest(
    fontSize: 14,
    fontWeight: FontWeight.w500, // medium
    height: 1.43, // 20px
  );

  // systemItem Text Style
  static final TextStyle systemItem = GoogleFonts.onest(
    fontSize: 14,
    fontWeight: FontWeight.w600, // semi bold
    height: 1.43, // 20px
  );

  // systemAlert Text Style
  static final TextStyle systemAlert = GoogleFonts.onest(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    height: 1.5, // 24px
  );
}
