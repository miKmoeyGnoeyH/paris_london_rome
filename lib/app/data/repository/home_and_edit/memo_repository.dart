import 'package:paris_london_rome/app/data/model/home_and_edit/memo_model.dart';
import 'package:paris_london_rome/app/data/provider/home_and_edit/memo_provider.dart';

class MemoRepository {
  final MemoProvider memoProvider;

  MemoRepository({required this.memoProvider});

  getMemos() {
    return memoProvider.getMemos();
  }

  saveMemos(List<MemoModel> memos) {
    return memoProvider.saveMemos(memos);
  }
}