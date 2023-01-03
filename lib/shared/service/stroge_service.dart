
import 'package:blog/model/blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FireStoreService extends GetxService {
  Future<FireStoreService> init() async {
    return this;
  }

  FirebaseFirestore? db = FirebaseFirestore.instance;

  saveBlogFireStore(Blog blog) {
    try {
      var collection= db!.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection("blogs");
      blog.id=collection.id;
      collection.doc(collection.id).set(blog.toJson());
      Get.snackbar("Succes", "The record has been successfully added $blog");
    } catch (e) {
      Get.snackbar("Eror", "$e");
    }
  }

  Future<List<Blog>?> getBlogFireStore() async {
    List<Blog> bloglist = [];
    QuerySnapshot<Map<String, dynamic>> a = await db!.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).collection("blogs").get();
    a.docs.forEach((element) {
      bloglist.add(Blog.fromJson(element.data()));
    });
    return bloglist;
  }
}
