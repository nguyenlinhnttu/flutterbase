class User {
  String id;
  String account;
  String user_name;
  String display_name;
  String avatar;
  String token;

  User({
    this.id,
    this.account,
    this.user_name,
    this.display_name,
    this.avatar,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    account = json['account'];
    user_name = json['user_name'];
    display_name = json['display_name'];
    avatar = json['avatar'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['account'] = this.account;
    data['user_name'] = this.user_name;
    data['display_name'] = this.display_name;
    data['avatar'] = this.avatar;
    data['token'] = this.token;
    return data;
  }
}
