import 'package:get/get.dart';
import 'package:paris_london_rome/app/data/model/home/memo_model.dart';
import 'package:paris_london_rome/app/data/repository/home/memo_repository.dart';

class EditController extends GetxController {
  final MemoRepository memoRepository;

  EditController({required this.memoRepository});

  final _memo = MemoModel().obs;

  get memo => _memo.value;

  set memo(value) => _memo.value = value;

  updateTitle(String title) {
    memo.title = title;
  }
  updateContent(String content) {
    memo.content = content;
  }
}