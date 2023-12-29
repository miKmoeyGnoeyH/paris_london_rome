import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/memo_controller.dart';
import 'custom_alert_dialog_widget.dart';
import 'memo_widget.dart';

class MemosListViewWidget extends StatelessWidget {
  const MemosListViewWidget({
    super.key,
    required this.controller,
    required this.height,
    required this.width,
  });

  final MemoController controller;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GetX<MemoController>(
      initState: (state) {
        Get.find<MemoController>().getMemos();
      },
      builder: (controller) {
        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialogWidget(
                        title: '삭제',
                        content: '이 메모를 삭제하시겠습니까?',
                        deny: '아니오',
                        accept: '삭제',
                        arguments: index,
                        onAccept: controller.deleteMemo,
                      );
                    },
                  );
                }
                if (direction == DismissDirection.startToEnd) {
                  await controller.editMemo(index);
                  return false;
                }
                return null;
              },
              background: Container(
                decoration: BoxDecoration(
                  // color: const Color(0xffcbfff5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.edit,
                            // color: Color(0xffcbfff5),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              secondaryBackground: Container(
                decoration: BoxDecoration(
                  // color: const Color(0xffffd9e7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.delete,
                            // color: Color(0xffffd9e7),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              child: MemoWidget(
                height: height,
                width: width,
                index: index,
                controller: controller,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: controller.memos.length,
        );
      },
    );
  }
}
