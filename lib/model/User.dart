class User {
  String? email;
  String? cpf;
  String? password;
  String? confirmPassword;

  User({this.email, this.cpf, this.password, this.confirmPassword});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    cpf = json['cpf'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['cpf'] = this.cpf;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
