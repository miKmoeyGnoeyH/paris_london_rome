import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paris_london_rome/app/controller/edit/edit_controller.dart';
import 'package:paris_london_rome/app/data/provider/home/memo_provider.dart';
import 'package:paris_london_rome/app/data/repository/home/memo_repository.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController>(() => EditController(
        memoRepository: MemoRepository(
            memoProvider: MemoProvider(getStorage: GetStorage()))));
  }
}
