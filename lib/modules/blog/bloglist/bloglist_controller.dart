import 'package:blog/model/blog.dart';
import 'package:blog/shared/service/stroge_service.dart';
import 'package:get/get.dart';

class BlogListController extends GetxController {
  FireStoreService fireStoreService = FireStoreService();
  var listBlog = [Blog.init()].obs;

  getBlogList() async {
    listBlog.value =(await fireStoreService.getBlogFireStore())!;
    print(listBlog);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getBlogList();
    super.onInit();
  }
}
