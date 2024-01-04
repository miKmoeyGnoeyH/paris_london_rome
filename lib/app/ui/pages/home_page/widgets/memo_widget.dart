import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:paris_london_rome/app/controller/settings/theme_controller.dart';

import '../../../../controller/home_and_edit/memo_controller.dart';


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
  final ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Theme
          .of(context)
          .colorScheme
          .primary,
      Theme
          .of(context)
          .colorScheme
          .secondary,
      Theme
          .of(context)
          .colorScheme
          .tertiary,
    ];

    final double titleSize = Theme.of(context).textTheme.titleMedium!.fontSize! * 1.6;
    final double bodySize = Theme.of(context).textTheme.bodyMedium!.fontSize! * 1.5;

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        height: isExpanded ? null : 10 + titleSize + 12 + 3 * bodySize + 15,
        width: isExpanded ? null : widget.width - 20,
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .colorScheme
              .background,
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
        // TODO : Text and Icon relocation, it is possible to should modify widget expanding logic
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: isExpanded ? null : titleSize,
                    width: double.infinity,
                    child: Text(
                      widget.controller.memos[widget.index].title,
                      maxLines: isExpanded ? null : 1,
                      overflow: isExpanded ? null : TextOverflow.ellipsis,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: isExpanded ? null : bodySize * 3,
                    child: Text(
                      widget.controller.memos[widget.index].content,
                      maxLines: isExpanded ? null : 3,
                      overflow: isExpanded ? null : TextOverflow.ellipsis,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up_rounded : Icons
                  .keyboard_arrow_down_rounded,
              size: 15,
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground
                  .withAlpha(127),
            ),
          ],
        ),
      ),
    );
  }
}
