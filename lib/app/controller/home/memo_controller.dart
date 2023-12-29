import 'dart:developer';

import 'package:get/get.dart';
import 'package:paris_london_rome/app/data/repository/home/memo_repository.dart';
import 'package:paris_london_rome/app/routes/app_pages.dart';

import '../../data/model/home/memo_model.dart';

class MemoController extends GetxController {
  final MemoRepository memoRepository;

  MemoController({required this.memoRepository});

  final _memos = <MemoModel>[].obs;

  get memos => _memos.value;

  set memos(value) => _memos.value = value;

  final _memo = MemoModel().obs;

  get memo => _memo.value;

  set memo(value) => _memo.value = value;

  getMemos() async {
    memos = await memoRepository.getMemos();
  }

  saveMemos() {
    memoRepository.saveMemos(memos);
  }

  addMemo(MemoModel memo) async {
    await memos.add(memo);
    saveMemos();
    getMemos();
  }

  createNewMemo() {
    memo = MemoModel();
    Get.toNamed(
      Routes.editPage,
      arguments: {
        'title': '새로운 메모',
        'function': () {
          if (memo.title != null &&
              memo.content != null &&
              memo.title != '' &&
              memo.content != '') {
            addMemo(memo);
            log('New Memo Add');
          }
        }
      },
    );
  }

  deleteMemo(int index) {
    memos.removeAt(index);
    saveMemos();
    getMemos();
  }

  editMemo(int index) {
    memo = memos[index];
    Get.toNamed(
      Routes.editPage,
      arguments: {
        'title': '메모 편집',
        'function': () async {
          if (memo.title == '' && memo.content == '') {
            deleteMemo(index);
          }
          else {
            saveMemos();
            getMemos();
          }
        }
      },
    );
  }
}
