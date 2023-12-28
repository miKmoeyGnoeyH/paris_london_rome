import 'package:flutter/material.dart';

import '../../../controller/memo_controller.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  const CustomAlertDialogWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.content,
    required this.deny,
    required this.accept,
    required this.onAccept,
  });

  final MemoController controller;
  final String title;
  final String content;
  final String deny;
  final String accept;
  final Function onAccept;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: Text(
            deny,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(
            accept,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () {
            onAccept;
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
