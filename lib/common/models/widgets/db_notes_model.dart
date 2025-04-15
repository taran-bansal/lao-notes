class DbNotesModel {
  final int? id;
  final String title;
  final String body;
  final String? createdOn;
  final String updatedOn;

  DbNotesModel({
    this.id,
    required this.title,
    required this.body,
    this.createdOn,
    required this.updatedOn,
  });

  factory DbNotesModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return DbNotesModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdOn: json['createdOn'],
      updatedOn: json['updatedOn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      if(createdOn != null)'createdOn': createdOn,
      'updatedOn': updatedOn,
    };
  }

}
