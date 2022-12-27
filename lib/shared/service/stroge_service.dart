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

  getBlogFireStore() {
    final docRef = db!.collection("blogs");
    docRef.get().then((value)  {
      value.docs.forEach((element) { 
    Blog blog=    Blog.fromJson(element.data());
       print(  Blog(id: element.id,comment: blog.comment,title: blog.title) );
      });
    } );
    
  }
}
