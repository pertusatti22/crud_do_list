class CrudDoModel {
  String? title;
  String? subtitle;
  bool? done;

  CrudDoModel(this.title, this.subtitle, [this.done = false]);

  CrudDoModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['done'] = done;
    return data;
  }
}
