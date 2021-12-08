
class User {
  String image;
  String name, phone, token_user;
  bool success;
  User({this.image = '', this.name = '', this.phone = '',this.token_user ='', this.success = false});

  String toString() => '\nimage: $image'
      '\nName: $name'
      '\nPhone: $phone'
      '\nsuccess: ${success?'true':'false'}'
      '\ntoken_user: $token_user';

  User fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    success = json['success'];
    token_user = json['token_user'];
    return this;
  }

  Map<String, dynamic> toJson() => {
    'image': image,
    'name': name,
    'phone': phone,
    'success': success,
    'token_user': token_user
  };

  void clear() {
    image = '';
    name = '';
    phone = '';
    token_user = '';
    success = false;
  }

  void setValues({String image = '', String name = '', String phone = '', String token_user = '', bool success = false}) {
    this.image = image;
    this.name = name;
    this.phone = phone;
    this.token_user;
    this.success = success;
  }
}