class Data {
   String phone;
   String name;
   String avatar;

  Data({ this.phone,  this.name,  this.avatar});

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
