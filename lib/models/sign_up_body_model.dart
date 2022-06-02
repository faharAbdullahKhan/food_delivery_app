class SignUpBody {
  String name;
  String password;
  String email;
  String phone;
  SignUpBody(
      {required this.name,
      required this.password,
      required this.email,
      required this.phone});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["f_name"] = this.name;
    data["phone"] = this.phone;
    data["email"] = this.email;
    data["password"] = this.phone;
    return data;
  }
}
