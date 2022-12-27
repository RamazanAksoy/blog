
import 'package:blog/shared/service/stroge_service.dart';
import 'package:get/get.dart';


class BlogListController extends GetxController {


FireStoreService fireStoreService=FireStoreService();


getBlogList(){
  fireStoreService.getBlogFireStore();
}

@override
  void onInit() {
    // TODO: implement onInit
    getBlogList();
    super.onInit();
  }
}
