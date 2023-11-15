class ModelUser {
  String? name;
  String? email;
  String? photo;

  ModelUser({this.name, this.email, this.photo});

  ModelUser.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['photo'] = photo;
    return data;
  }
}
