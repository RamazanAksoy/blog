import 'package:blog/model/blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FireStoreService extends GetxService {
  Future<FireStoreService> init() async {
    return this;
  }

  FirebaseFirestore? db = FirebaseFirestore.instance;

  saveBlogFireStore(Blog blog) {
    try {
      db!.collection("blogs").doc().set(blog.toJson());
      Get.snackbar("Succes", "The record has been successfully added");
    } catch (e) {
      Get.snackbar("Eror", "$e");
    }
  }

  Future<List<Blog>?> getBlogFireStore() async {
    List<Blog> bloglist = [];
    QuerySnapshot<Map<String, dynamic>> a = await db!.collection("blogs").get();
    a.docs.forEach((element) {
      Blog blog = Blog.fromJson(element.data());
      bloglist.add(Blog(id: element.id, comment: blog.comment, title: blog.title));
    });
    return bloglist;
  }
}
