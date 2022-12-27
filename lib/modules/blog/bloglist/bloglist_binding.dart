import 'package:get/get.dart';

import 'bloglist_controller.dart';


class BlogListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BlogListController());
  }
}
