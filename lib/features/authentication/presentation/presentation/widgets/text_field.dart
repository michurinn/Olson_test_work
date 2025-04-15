import 'package:flutter/material.dart';
import 'package:olkon_test_work/extensions/theme_extensions/build_context_theme_color_extensions.dart';
import 'package:olkon_test_work/extensions/theme_extensions/build_context_theme_text_style_extension.dart';

class OlkonTextField extends StatefulWidget {
  const OlkonTextField(
      {super.key,
      this.hasError = false,
      this.enabled,
      this.label,
      this.hintText,
      this.obscureText,
      this.showErrorLabel,
      this.onChanged,

      ///required this.controller,
      this.keyboardType,
      this.suffixIcon});

  final bool? hasError;
  final bool? enabled;
  final String? label;
  final String? hintText;
  final bool? obscureText;
  final bool? showErrorLabel;
  final ValueChanged<String>? onChanged;

  ///final TextEditingController controller;
  final TextInputType? keyboardType;
  final Icon? suffixIcon;
  @override
  State<OlkonTextField> createState() => _OlkonTextFieldState();
}

class _OlkonTextFieldState extends State<OlkonTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(
        () => widget.onChanged?.call(_controller.value.text),
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: context.themeTextStyle.text1.copyWith(color: context.color?.dialogBlue),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        isCollapsed: true,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        hintStyle: context.themeTextStyle.body14
            .copyWith(color: context.color?.uiLightBlack),
        enabledBorder: widget.hasError == false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                    color: context.color?.uiLightBlack ?? Colors.transparent,
                    width: 1.5),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                    color: context.color?.supportRed ?? Colors.transparent,
                    width: 1.5),
              ),
        focusedBorder: widget.hasError == false
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                    color: context.color?.brandBlue ?? Colors.transparent,
                    width: 1.5),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                    color: context.color?.supportRed ?? Colors.transparent,
                    width: 1.5),
              ),
        disabledBorder: InputBorder.none,
        filled: true,
        
        fillColor: widget.hasError == true
            ? context.color?.lightRed
            : context.color?.brandLightBlue,
        label: widget.label == null
            ? null
            : Text(
                widget.label ?? 'Label',
                style: widget.hasError == true
                    ? context.themeTextStyle.text4.copyWith(
                        color: context.color?.supportRed,
                      )
                    : context.themeTextStyle.text4.copyWith(
                        color: context.color?.uiLightBlack,
                      ),
              ),
        labelStyle: context.themeTextStyle.text4.copyWith(
          color: context.color?.uiLightBlack,
        ),
      ),
    );
  }
}
