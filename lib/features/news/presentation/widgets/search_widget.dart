import 'package:flutter/material.dart';
import 'package:olkon_test_work/extensions/string_hardcoded.dart';
import 'package:olkon_test_work/features/authentication/presentation/presentation/widgets/text_field.dart';
 
class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.onChanged});
  final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return OlkonTextField(
      hintText: 'Tap for searching...'.hardcoded,
      suffixIcon: const Icon(Icons.search),
      onChanged: (value) => onChanged?.call(value),
    );
  }
}
