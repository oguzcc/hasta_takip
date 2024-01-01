class SignUpEmailReq {
  SignUpEmailReq(
    this.email,
    this.password,
    this.name,
    this.firstName,
    this.lastName,
  );

  final String? email;
  final String? password;
  final String? name;
  final String? firstName;
  final String? lastName;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'name': name,
        'firstName': firstName,
        'lastName': lastName,
      };
}
