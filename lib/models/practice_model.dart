class PracticeModel{
  int? userId;
  int? id;
  String? title;
  String? body;

  PracticeModel({
    this.userId,
    this.id,
    this.title,
    this.body
});

  PracticeModel.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final myMap = <String, dynamic>{};
    myMap['userId'] = userId;
    myMap['id'] = id;
    myMap['title'] = title;
    myMap['body'] = body;

    return myMap;
  }

}