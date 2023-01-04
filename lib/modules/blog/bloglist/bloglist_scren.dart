import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animation/fadeanimation.dart';
import 'bloglist_controller.dart';

class BlogListScreen extends GetWidget<BlogListController> {
  const BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Obx(() => controller.listBlog.last.comment == null
            ? const Center(child: CircularProgressIndicator())
            : buildPage(context)));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        "Blog Listss",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black87, fontSize: 18),
      ),
      centerTitle: true,
      elevation: 0,
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.listBlog.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FadeAnimation((index * 0.3 + 0.2), buildListCard(index)),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Card buildListCard(int index) {
    return Card(
      elevation: 0.5,
      child: ListTile(
        leading: const Icon(Icons.textsms_outlined),
        title: Text('${controller.listBlog[index].title}'),
        subtitle: Text('${controller.listBlog[index].comment}'),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }

  Padding buildButtonLogin() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: const EdgeInsets.only(top: 3, left: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: const Border(
              bottom: BorderSide(color: Colors.black),
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
            )),
        child: MaterialButton(
          minWidth: double.infinity,
          height: 60,
          onPressed: () {},
          color: Colors.greenAccent,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: const Text(
            "Save",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget makeInput(
    TextEditingController textEditingController, {
    label,
    obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'boş olamaz';
            }
            return null;
          },
          controller: textEditingController,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
