class Blog {
  String? title;
  String? comment;

  Blog({this.title, this.comment});

  Blog.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['comment'] = this.comment;
    return data;
  }
}
