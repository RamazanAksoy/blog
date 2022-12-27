import 'package:blog/modules/auth/login/login_controller.dart';
import 'package:blog/modules/blog/blogadd/blogadd_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../animation/fadeanimation.dart';

class BlogAddScreen extends GetWidget<BlogAddController> {
  const BlogAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildPage(context));
  }

  SizedBox buildPage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const FadeAnimation(
                        1,
                        Text(
                          "Blog Add",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.2,
                        Text(
                          "Please enter blog information",
                          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )),
                  ],
                ),
                Form(
                  key: controller.formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(1.2, makeInput(controller.textEditingControllerTitle, label: "Title")),
                        FadeAnimation(1.3, makeInput(controller.textEditingControllerComment, label: "Comment", obscureText: true)),
                      ],
                    ),
                  ),
                ),
                FadeAnimation(1.4, buildButtonLogin()),
              ],
            ),
          ),
        ],
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
          onPressed: () {
            controller.blogSave();
          },
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
