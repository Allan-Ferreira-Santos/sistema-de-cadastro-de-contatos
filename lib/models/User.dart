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
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['cpf'] = cpf;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    return data;
  }
}
