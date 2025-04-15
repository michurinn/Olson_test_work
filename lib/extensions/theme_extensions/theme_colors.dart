import 'package:flutter/material.dart';
import 'package:olkon_test_work/styles/app_colors.dart';

// ThemeColors Class
class ThemeColors extends ThemeExtension<ThemeColors> {
  // Include all colors from AppColors
  final Color brandDarkBlue;
  final Color brandBlue;
  final Color brandLightBlue;
  final Color dialogBlue;
  final Color dialogRed;
  final Color uiWhite;
  final Color uiLightBlack;
  final Color supportOrange;
  final Color supportGreen;
  final Color supportRed;
  final Color lightRed;
  final Color supportViolent;
  final Color supportLazar;
  final Color supportLightRed;
  final Color supportLightGreen;
  final Color supportLightViolent;
  final Color supportLightBlue;
  final Color supportLightOrange;
  final Color socialVk;
  final Color socialTg;
  final Color socialWhtsp;
  final Color socialYoutube;
  final Color inactiveColor;

  ThemeColors({
    required this.brandDarkBlue,
    required this.brandBlue,
    required this.brandLightBlue,
    required this.dialogBlue,
    required this.dialogRed,
    required this.uiWhite,
    required this.uiLightBlack,
    required this.supportOrange,
    required this.supportGreen,
    required this.supportRed,
    required this.lightRed,
    required this.supportViolent,
    required this.supportLazar,
    required this.supportLightRed,
    required this.supportLightGreen,
    required this.supportLightViolent,
    required this.supportLightBlue,
    required this.supportLightOrange,
    required this.socialVk,
    required this.socialTg,
    required this.socialWhtsp,
    required this.socialYoutube,
    required this.inactiveColor,
  });

  // Define a default light theme
  factory ThemeColors.light() => ThemeColors(
        brandDarkBlue: AppColors.brandDarkBlue,
        brandBlue: AppColors.brandBlue,
        brandLightBlue: AppColors.brandLightBlue,
        dialogBlue: AppColors.dialogBlue,
        dialogRed: AppColors.dialogRed,
        uiWhite: AppColors.uiWhite,
        uiLightBlack: AppColors.uiLightBlack,
        supportOrange: AppColors.supportOrange,
        supportGreen: AppColors.supportGreen,
        supportRed: AppColors.supportRed,
        lightRed: AppColors.lightRed,
        supportViolent: AppColors.supportViolent,
        supportLazar: AppColors.supportLazar,
        supportLightRed: AppColors.supportLightRed,
        supportLightGreen: AppColors.supportLightGreen,
        supportLightViolent: AppColors.supportLightViolent,
        supportLightBlue: AppColors.supportLightBlue,
        supportLightOrange: AppColors.supportLightOrange,
        socialVk: AppColors.socialVk,
        socialTg: AppColors.socialTg,
        socialWhtsp: AppColors.socialWhtsp,
        socialYoutube: AppColors.socialYoutube,
        inactiveColor: AppColors.inactiveColor,
      );

  factory ThemeColors.dark() => ThemeColors(
        brandDarkBlue: AppColors.brandDarkBlue,
        brandBlue: AppColors.brandBlue,
        brandLightBlue: AppColors.brandLightBlue,
        dialogBlue: AppColors.dialogBlue,
        dialogRed: AppColors.dialogRed,
        uiWhite: AppColors.uiBlack,
        uiLightBlack: AppColors.uiLightBlack,
        supportOrange: AppColors.supportOrange,
        supportGreen: AppColors.supportGreen,
        supportRed: AppColors.supportRed,
        lightRed: AppColors.lightRed,
        supportViolent: AppColors.supportViolent,
        supportLazar: AppColors.supportLazar,
        supportLightRed: AppColors.supportLightRed,
        supportLightGreen: AppColors.supportLightGreen,
        supportLightViolent: AppColors.uiBlack,
        supportLightBlue: AppColors.supportLightBlue,
        supportLightOrange: AppColors.supportLightOrange,
        socialVk: AppColors.socialVk,
        socialTg: AppColors.socialTg,
        socialWhtsp: AppColors.socialWhtsp,
        socialYoutube: AppColors.socialYoutube,
        inactiveColor: AppColors.inactiveColor,
      );

  // Override the copyWith method
  @override
  ThemeColors copyWith({
    Color? brandDarkBlue,
    Color? brandBlue,
    Color? brandLightBlue,
    Color? dialogBlue,
    Color? dialogRed,
    Color? uiWhite,
    Color? uiLightBlack,
    Color? supportOrange,
    Color? supportGreen,
    Color? supportRed,
    Color? lightRed,
    Color? supportViolent,
    Color? supportLazar,
    Color? supportLightRed,
    Color? supportLightGreen,
    Color? supportLightViolent,
    Color? supportLightBlue,
    Color? supportLightOrange,
    Color? socialVk,
    Color? socialTg,
    Color? socialWhtsp,
    Color? socialYoutube,
    Color? inactiveColor,
  }) {
    return ThemeColors(
      brandDarkBlue: brandDarkBlue ?? this.brandDarkBlue,
      brandBlue: brandBlue ?? this.brandBlue,
      brandLightBlue: brandLightBlue ?? this.brandLightBlue,
      dialogBlue: dialogBlue ?? this.dialogBlue,
      dialogRed: dialogRed ?? this.dialogRed,
      uiWhite: uiWhite ?? this.uiWhite,
      uiLightBlack: uiLightBlack ?? this.uiLightBlack,
      supportOrange: supportOrange ?? this.supportOrange,
      supportGreen: supportGreen ?? this.supportGreen,
      supportRed: supportRed ?? this.supportRed,
      lightRed: lightRed ?? this.lightRed,
      supportViolent: supportViolent ?? this.supportViolent,
      supportLazar: supportLazar ?? this.supportLazar,
      supportLightRed: supportLightRed ?? this.supportLightRed,
      supportLightGreen: supportLightGreen ?? this.supportLightGreen,
      supportLightViolent: supportLightViolent ?? this.supportLightViolent,
      supportLightBlue: supportLightBlue ?? this.supportLightBlue,
      supportLightOrange: supportLightOrange ?? this.supportLightOrange,
      socialVk: socialVk ?? this.socialVk,
      socialTg: socialTg ?? this.socialTg,
      socialWhtsp: socialWhtsp ?? this.socialWhtsp,
      socialYoutube: socialYoutube ?? this.socialYoutube,
      inactiveColor: inactiveColor ?? this.inactiveColor,
    );
  }

  // Override the lerp method
  @override
  ThemeColors lerp(ThemeExtension<ThemeColors>? other, double t) {
    if (other is! ThemeColors) return this;

    return ThemeColors(
      brandDarkBlue: Color.lerp(brandDarkBlue, other.brandDarkBlue, t)!,
      brandBlue: Color.lerp(brandBlue, other.brandBlue, t)!,
      brandLightBlue: Color.lerp(brandLightBlue, other.brandLightBlue, t)!,
      dialogBlue: Color.lerp(dialogBlue, other.dialogBlue, t)!,
      dialogRed: Color.lerp(dialogRed, other.dialogRed, t)!,
      uiWhite: Color.lerp(uiWhite, other.uiWhite, t)!,
      uiLightBlack: Color.lerp(uiLightBlack, other.uiLightBlack, t)!,
      supportOrange: Color.lerp(supportOrange, other.supportOrange, t)!,
      supportGreen: Color.lerp(supportGreen, other.supportGreen, t)!,
      supportRed: Color.lerp(supportRed, other.supportRed, t)!,
      lightRed: Color.lerp(lightRed, other.lightRed, t)!,
      supportViolent: Color.lerp(supportViolent, other.supportViolent, t)!,
      supportLazar: Color.lerp(supportLazar, other.supportLazar, t)!,
      supportLightRed: Color.lerp(supportLightRed, other.supportLightRed, t)!,
      supportLightGreen:
          Color.lerp(supportLightGreen, other.supportLightGreen, t)!,
      supportLightViolent:
          Color.lerp(supportLightViolent, other.supportLightViolent, t)!,
      supportLightBlue:
          Color.lerp(supportLightBlue, other.supportLightBlue, t)!,
      supportLightOrange:
          Color.lerp(supportLightOrange, other.supportLightOrange, t)!,
      socialVk: Color.lerp(socialVk, other.socialVk, t)!,
      socialTg: Color.lerp(socialTg, other.socialTg, t)!,
      socialWhtsp: Color.lerp(socialWhtsp, other.socialWhtsp, t)!,
      socialYoutube: Color.lerp(socialYoutube, other.socialYoutube, t)!,
      inactiveColor: Color.lerp(inactiveColor, other.inactiveColor, t)!,
    );
  }
}
