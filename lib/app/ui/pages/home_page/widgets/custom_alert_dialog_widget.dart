import 'package:flutter/material.dart';


class CustomAlertDialogWidget extends StatelessWidget {
  CustomAlertDialogWidget({
    super.key,
    this.title,
    required this.content,
    required this.deny,
    required this.accept,
    required this.arguments,
    required this.onAccept,
  });

  final String? title;
  final String content;
  final String deny;
  final String accept;
  dynamic arguments;
  final Function onAccept;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            deny,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text(
            accept,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onPressed: () {
            onAccept(arguments);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
