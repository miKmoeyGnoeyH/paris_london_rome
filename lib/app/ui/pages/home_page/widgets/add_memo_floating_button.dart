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
    return SizedBox(
      width: width * 0.2,
      height: width * 0.2,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
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
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}