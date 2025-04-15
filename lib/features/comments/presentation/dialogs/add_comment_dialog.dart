import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:olkon_test_work/constants/app_constants.dart';
import 'package:olkon_test_work/extensions/string_hardcoded.dart';

/// Shows a dialog that allows the user to enter a new comment description.
///
/// [context] The BuildContext used to display the dialog.
/// [initialText] An optional initial text to pre-fill the dialog's text field.
///
/// Returns the text entered by the user, or `null` if the dialog was canceled.
Future<String?> showDescriptionDialog(
    BuildContext context, ValueChanged<String> getCommentText) async {
  ///final ValueChanged getCommentText = getCommentText;
  var storedText = '';
  String onChanged(String text) => storedText = text;
  final result = await context.octopus.showDialog<String?>(
    (context) {
      return AlertDialog(
        title: Text('Add a new comment'.hardcoded),
        content: _CommentsDialog(
          initialText: '',
          onEditing: onChanged,
        ),
        actions: [
          TextButton(
            child: Text('Cancel'.hardcoded),
            onPressed: () {
              context.octopus.maybePop();
            },
          ),
          TextButton(
            child: Text('Add'.hardcoded),
            onPressed: () {
              getCommentText(storedText);
              context.octopus.maybePop();
            },
          ),
        ],
      );
    },
  );
  return result;
}

class _CommentsDialog extends StatefulWidget {
  const _CommentsDialog({required this.onEditing, this.initialText});
  final String? initialText;
  final ValueChanged<String> onEditing;
  @override
  State<_CommentsDialog> createState() => _CommentsDialogState();
}

class _CommentsDialogState extends State<_CommentsDialog> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    if (widget.initialText != null) {
      controller.text = widget.initialText!;
    }
    controller.addListener(
      () => widget.onEditing(
        controller.text,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      minLines: 4,
      maxLines: 4,
      decoration: InputDecoration(
          hintText: 'Think about the important things'.hardcoded),
      maxLength: AppConstants.maxTitleLenght,
    );
  }
}
