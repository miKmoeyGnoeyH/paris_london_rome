class MemoModel {
  String? title;
  String? content;

  MemoModel({title = '', content = ''}) {
    title = title;
    content = content;
  }

  MemoModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'];
}
