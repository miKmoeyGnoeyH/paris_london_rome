import 'package:flutter/material.dart';
import 'package:paris_london_rome/app/ui/widgets/custom_appbar.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String title = 'Edit';

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy > 0) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: CustomAppBar(
            title: title,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: '제목을 입력해 주세요',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 20, height: 1),
                  maxLines: null,
                  cursorColor: Colors.black,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '내용을 입력해 주세요',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 14, height: 1),
                  maxLines: null,
                  cursorColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
