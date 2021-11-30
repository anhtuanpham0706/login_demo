
class User {
  String image;
  String name, phone;
  bool success;
  User({this.image = '', this.name = '', this.phone = '', this.success = false});

  String toString() => '\nimage: $image'
      '\nName: $name'
      '\nPhone: $phone'
      '\nGender: ${success?'true':'false'}';

  User fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    success = json['success'];
    return this;
  }

  Map<String, dynamic> toJson() => {
    'image': image,
    'name': name,
    'phone': phone,
    'success': success
  };

  void clear() {
    image = '';
    name = '';
    phone = '';
    success = false;
  }

  void setValues({String image = '', String name = '', String phone = '', bool success = false}) {
    this.image = image;
    this.name = name;
    this.phone = phone;
    this.success = success;
  }
}