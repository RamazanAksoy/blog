import 'package:get/get.dart';

import 'blogadd_controller.dart';

class BlogAddBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BlogAddController());
  }
}
