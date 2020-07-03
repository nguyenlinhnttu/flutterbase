class User {
  String id;
  String email;
  String userName;
  String phone;
  String token;

  User({
    this.id,
    this.email,
    this.userName,
    this.phone,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    userName = json['userName'];
    phone = json['phone'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['phone'] = this.phone;
    data['token'] = this.token;
    return data;
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, userName: $userName, phone: $phone, token: $token}';
  }
}
