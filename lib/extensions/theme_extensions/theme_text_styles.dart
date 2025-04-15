import 'package:flutter/material.dart';
import 'package:olkon_test_work/styles/app_colors.dart';
import 'package:olkon_test_work/styles/app_text_style.dart';

// В случае использования TextStyle, стиль которых буде отличаться от стиля,
// определённого в TextStyle текущей темы, кастомный стиль можно описать в данном расширении
// и использовать его
class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle title4;
  final TextStyle title5;
  final TextStyle title6;
  final TextStyle title7;
  final TextStyle title8;
  final TextStyle title9;
  final TextStyle title10;
  final TextStyle body13;
  final TextStyle body14;
  final TextStyle body15;
  final TextStyle body16;
  final TextStyle text1;
  final TextStyle text2;
  final TextStyle text3;
  final TextStyle text4;

  // Light theme constructor
  ThemeTextStyles.light()
      : title1 = AppTextStyle.title1.copyWith(color: AppColors.uiBlack),
        title2 = AppTextStyle.title2.copyWith(color: AppColors.uiBlack),
        title3 = AppTextStyle.title3.copyWith(color: AppColors.uiBlack),
        title4 = AppTextStyle.title4.copyWith(color: AppColors.uiBlack),
        title5 = AppTextStyle.title5.copyWith(color: AppColors.uiBlack),
        title6 = AppTextStyle.title6.copyWith(color: AppColors.uiBlack),
        title7 = AppTextStyle.title7.copyWith(color: AppColors.uiBlack),
        title8 = AppTextStyle.title8.copyWith(color: AppColors.uiBlack),
        title9 = AppTextStyle.title9.copyWith(color: AppColors.uiBlack),
        title10 = AppTextStyle.title10.copyWith(color: AppColors.uiBlack),
        body13 = AppTextStyle.body13.copyWith(color: AppColors.uiBlack),
        body14 = AppTextStyle.body14.copyWith(color: AppColors.uiBlack),
        body15 = AppTextStyle.body15.copyWith(color: AppColors.uiBlack),
        body16 = AppTextStyle.body16.copyWith(color: AppColors.uiBlack),
        text1 = AppTextStyle.text1.copyWith(color: AppColors.uiBlack),
        text2 = AppTextStyle.text2.copyWith(color: AppColors.uiBlack),
        text3 = AppTextStyle.text3.copyWith(color: AppColors.uiBlack),
        text4 = AppTextStyle.text4.copyWith(color: AppColors.uiBlack);

  // Dark theme constructor
  ThemeTextStyles.dark()
      : title1 = AppTextStyle.title1.copyWith(color: AppColors.supportGreen),
        title2 = AppTextStyle.title2.copyWith(color: AppColors.supportGreen),
        title3 = AppTextStyle.title3.copyWith(color: AppColors.socialWhtsp),
        title4 = AppTextStyle.title4.copyWith(color: AppColors.supportLazar),
        title5 = AppTextStyle.title5.copyWith(color: AppColors.supportLazar),
        title6 = AppTextStyle.title6.copyWith(color: AppColors.supportLazar),
        title7 = AppTextStyle.title7.copyWith(color: AppColors.supportLazar),
        title8 = AppTextStyle.title8.copyWith(color: AppColors.supportLazar),
        title9 = AppTextStyle.title9.copyWith(color: AppColors.supportLazar),
        title10 = AppTextStyle.title10.copyWith(color: AppColors.supportLazar),
        body13 = AppTextStyle.body13.copyWith(color: AppColors.supportLazar),
        body14 = AppTextStyle.body14.copyWith(color: AppColors.supportLazar),
        body15 = AppTextStyle.body15.copyWith(color: AppColors.supportLazar),
        body16 = AppTextStyle.body16.copyWith(color: AppColors.supportLazar),
        text1 = AppTextStyle.text1.copyWith(color: AppColors.socialYoutube),
        text2 = AppTextStyle.text2.copyWith(color: AppColors.supportGreen),
        text3 = AppTextStyle.text3.copyWith(color: AppColors.supportGreen),
        text4 = AppTextStyle.text4.copyWith(color: AppColors.supportGreen);

  // General constructor
  ThemeTextStyles({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.title5,
    required this.title6,
    required this.title7,
    required this.title8,
    required this.title9,
    required this.title10,
    required this.body13,
    required this.body14,
    required this.body15,
    required this.body16,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? title1,
    TextStyle? titleH1,
    TextStyle? titleH2,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? title4,
    TextStyle? title5,
    TextStyle? title6,
    TextStyle? title7,
    TextStyle? title8,
    TextStyle? title9,
    TextStyle? title10,
    TextStyle? body13,
    TextStyle? body14,
    TextStyle? body15,
    TextStyle? body16,
    TextStyle? text1,
    TextStyle? text2,
    TextStyle? text3,
    TextStyle? text4,
  }) {
    return ThemeTextStyles(
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      title4: title4 ?? this.title4,
      title5: title5 ?? this.title5,
      title6: title6 ?? this.title6,
      title7: title7 ?? this.title7,
      title8: title8 ?? this.title8,
      title9: title9 ?? this.title9,
      title10: title10 ?? this.title10,
      body13: body13 ?? this.body13,
      body14: body14 ?? this.body14,
      body15: body15 ?? this.body15,
      body16: body16 ?? this.body16,
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      text3: text3 ?? this.text3,
      text4: text4 ?? this.text4,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
      covariant ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      title1: TextStyle.lerp(title1, other.title1, t)!,
      title2: TextStyle.lerp(title2, other.title2, t)!,
      title3: TextStyle.lerp(title3, other.title3, t)!,
      title4: TextStyle.lerp(title4, other.title4, t)!,
      title5: TextStyle.lerp(title5, other.title5, t)!,
      title6: TextStyle.lerp(title6, other.title6, t)!,
      title7: TextStyle.lerp(title7, other.title7, t)!,
      title8: TextStyle.lerp(title8, other.title8, t)!,
      title9: TextStyle.lerp(title9, other.title9, t)!,
      title10: TextStyle.lerp(title10, other.title10, t)!,
      body13: TextStyle.lerp(body14, other.body13, t)!,
      body14: TextStyle.lerp(body14, other.body14, t)!,
      body15: TextStyle.lerp(body15, other.body15, t)!,
      body16: TextStyle.lerp(body16, other.body16, t)!,
      text1: TextStyle.lerp(text1, other.text1, t)!,
      text2: TextStyle.lerp(text2, other.text2, t)!,
      text3: TextStyle.lerp(text3, other.text3, t)!,
      text4: TextStyle.lerp(text4, other.text4, t)!,
    );
  }
}
