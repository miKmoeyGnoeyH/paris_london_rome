import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:paris_london_rome/app/data/model/home_and_edit/memo_model.dart';

class MemoProvider {
  final GetStorage getStorage;

  MemoProvider({required this.getStorage});

  getMemos() {
    var memosString = getStorage.read('memos') ?? [];
    // log('memosString.runtimeType : ${memosString.runtimeType}');
    var memosToJson = jsonDecode(memosString.toString());
    List<MemoModel> memos = [];

    if (memosToJson.isNotEmpty) {
      for (var memoJson in memosToJson) {
        memos.add(MemoModel.fromJson(memoJson));
      }
    }
    // log('memos : ${memos.toString()}');
    // log('memos.runtimeType : ${memos.runtimeType}');
    return memos;
  }

  saveMemos(List<MemoModel> memos) async {
    List<Map> memosStringList = [];

    if (memos.isNotEmpty) {
      for (var element in memos) {
        memosStringList
            .add({'title': element.title, 'content': element.content});
      }
    }
    // log('jsonEncode(memosStringList).runtimeType : ${jsonEncode(memosStringList).runtimeType}');
    await getStorage.write('memos', jsonEncode(memosStringList));
    // log('Memos saved');
  }
}
