class Blog {
  String? id;
  String? title;
  String? comment;

  Blog({this.id,this.title, this.comment});
  Blog.init();
  @override
  String toString() {
    return 'Blog{id: $id,title: $title, comment: $comment}';
  }

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['comment'] = this.comment;
    return data;
  }
}
