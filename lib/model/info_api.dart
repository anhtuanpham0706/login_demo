class Data {
  late String phone;
  late String name;
  late String avatar;

  Data({required this.phone, required this.name, required this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    name = json['name'];
    avatar = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['image'] = this.avatar;
    return data;
  }

  @override
  String toString() {
    return '"data" : { "id": $phone, "name": $name, "image": $avatar}';
  }
}
