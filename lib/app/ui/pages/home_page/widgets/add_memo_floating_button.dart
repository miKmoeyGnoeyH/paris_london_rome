import 'package:flutter/material.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

import '../../../../controller/home_and_edit/memo_controller.dart';

class AddMemoFloatingButton extends StatelessWidget {
  const AddMemoFloatingButton({
    super.key,
    required this.width,
    required this.controller,
  });

  final double width;
  final MemoController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.2,
      height: width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onBackground.withAlpha(155),
            blurRadius: 7,
            offset: const Offset(2.5, 2.5),
          ),
        ]
      ),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: GradientOutlineInputBorder(
          gradient: const LinearGradient(
            begin: Alignment(-1, -1),
            end: Alignment(1, 1),
            colors: [
              Color(0xffCBFFF5),
              Color(0xffFFD9E7),
              Color(0xffFFF8C1),
            ],
          ),
          width: 3,
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          controller.createNewMemo();
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }
}