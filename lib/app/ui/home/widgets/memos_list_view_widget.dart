import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/memo_controller.dart';

List<Color> colors = [
  const Color(0xffcbfff5),
  const Color(0xffffd9e7),
  const Color(0xfffff8c1),
];

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
      builder: (_) {
        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: const Text('삭제'),
                        content: const Text('삭?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              '아니오',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.deleteMemo(index);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              '삭',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
                if (direction == DismissDirection.startToEnd) {
                  controller.editMemo(index);
                  return false;
                }
              },
              background: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffcbfff5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              secondaryBackground: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffd9e7),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                  height: height * 0.13,
                  width: width - 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: colors[index % 3],
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colors[index % 3],
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _.memos[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _.memos[index].content,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  )),
            );
          },
          separatorBuilder: (context, index) =>
          const SizedBox(height: 10),
          itemCount: _.memos.length,
        );
      },
    );
  }
}