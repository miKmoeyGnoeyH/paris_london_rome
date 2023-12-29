import 'package:flutter/material.dart';

import '../../../../controller/home/memo_controller.dart';

List<Color> colors = [
  const Color(0xffcbfff5),
  const Color(0xffffd9e7),
  const Color(0xfffff8c1),
];

class MemoWidget extends StatefulWidget {
  const MemoWidget({
    super.key,
    required this.height,
    required this.width,
    required this.index,
    required this.controller,
  });

  final double height;
  final double width;
  final int index;
  final MemoController controller;

  @override
  State<StatefulWidget> createState() => _MemoWidgetState();
}

class _MemoWidgetState extends State<MemoWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        height: isExpanded ? null : widget.height * 0.13,
        width: isExpanded? null : widget.width - 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colors[widget.index % 3],
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: colors[widget.index % 3],
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.controller.memos[widget.index].title,
                    maxLines: isExpanded ? null : 1,
                    overflow: isExpanded ? null : TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.controller.memos[widget.index].content,
                    maxLines: isExpanded ? null : 3,
                    overflow: isExpanded ? null : TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
              size: 15,
              color: Colors.black.withAlpha(50),
            ),
          ],
        ),
      ),
    );
  }
}
