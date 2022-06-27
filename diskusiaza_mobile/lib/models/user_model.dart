class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? tanggalLahir;
  String? jenisKelamin;
  String? token;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.tanggalLahir,
    this.jenisKelamin,
    this.token,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      password: map['password'],
      tanggalLahir: map['tanggalLahir'],
      jenisKelamin: map['jenisKelamin'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'tanggalLahir': tanggalLahir,
      'jenisKelamin': jenisKelamin,
      'token': token,
    };
  }
}
