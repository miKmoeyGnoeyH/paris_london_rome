
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:paris_london_rome/app/controller/home_and_edit/memo_controller.dart';

import 'package:paris_london_rome/app/ui/widgets/custom_appbar.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<StatefulWidget> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final memo = Get.find<MemoController>().memo;
  final TextEditingController _titleController =
      TextEditingController(text: Get.find<MemoController>().memo.title);
  final TextEditingController _contentController =
      TextEditingController(text: Get.find<MemoController>().memo.content);

  final String screenTitle = Get.arguments['title'];
  final Function function = Get.arguments['function'];

  @override
  void dispose() {
    function();
    _titleController.dispose();
    _contentController.dispose();
    // log('EditPageDispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy > 0) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: CustomAppBar(
            title: screenTitle,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: '제목을 입력해 주세요',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 20, height: 1),
                  maxLines: null,
                  cursorColor: Colors.black,
                  onChanged: (title) {
                    setState(() {
                      memo.title = title;
                    });
                  },
                  controller: _titleController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: '내용을 입력해 주세요',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 14, height: 1),
                  maxLines: null,
                  cursorColor: Colors.black,
                  onChanged: (content) {
                    setState(() {
                      memo.content = content;
                    });
                  },
                  controller: _contentController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
