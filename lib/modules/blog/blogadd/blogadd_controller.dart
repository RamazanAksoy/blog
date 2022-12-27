import 'package:blog/shared/service/stroge_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/blog.dart';

class BlogAddController extends GetxController {
  Key formkey = GlobalKey<FormState>();
  TextEditingController textEditingControllerTitle = TextEditingController();
  TextEditingController textEditingControllerComment = TextEditingController();
  FireStoreService fireStoreService = FireStoreService();

  blogSave() {
    fireStoreService.saveBlogFireStore(Blog(title: textEditingControllerTitle.text, comment: textEditingControllerComment.text));
  }
}
