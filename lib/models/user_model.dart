class ResponseResultUserModel {
  dynamic data;

  ResponseResultUserModel({this.data});

  ResponseResultUserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }
}

class UserModel {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? nohp;
  String? foto;
  String? tanggalLahir;
  String? jenisKelamin;
  int? totalFollowers;
  int? totalFollowed;
  int? totalTheradCreated;

  UserModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.nohp,
      this.foto,
      this.tanggalLahir,
      this.jenisKelamin,
      this.totalFollowers,
      this.totalFollowed,
      this.totalTheradCreated});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    nohp = json['nohp'];
    foto = json['foto'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    totalFollowers = json['total_followers'];
    totalFollowed = json['total_followed'];
    totalTheradCreated = json['total_therad_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['nohp'] = nohp;
    data['foto'] = foto;
    data['tanggal_lahir'] = tanggalLahir;
    data['jenis_kelamin'] = jenisKelamin;
    data['total_followers'] = totalFollowers;
    data['total_followed'] = totalFollowed;
    data['total_therad_created'] = totalTheradCreated;
    return data;
  }
}




// class ResponseResultUserModel {
//   dynamic data;

//   ResponseResultUserModel({this.data});

//   ResponseResultUserModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
//   }
// }

// class UserModel {
//   String? firstname;
//   String? lastname;
//   String? email;
//   String? nohp;
//   String? foto;
//   String? tanggalLahir;
//   String? jenisKelamin;
//   String? roleName;

//   UserModel({
//     this.firstname,
//     this.lastname,
//     this.email,
//     this.nohp,
//     this.foto,
//     this.tanggalLahir,
//     this.jenisKelamin,
//     this.roleName,
//   });

//   UserModel.fromJson(Map<String, dynamic> json) {
//     firstname = json['firstname'];
//     lastname = json['lastname'];
//     email = json['email'];
//     nohp = json['nohp'];
//     foto = json['foto'];
//     tanggalLahir = json['tanggal_lahir'];
//     jenisKelamin = json['jenis_kelamin'];
//     roleName = json['role_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['firstname'] = firstname;
//     data['lastname'] = lastname;
//     data['email'] = email;
//     data['nohp'] = nohp;
//     data['foto'] = foto;
//     data['tanggal_lahir'] = tanggalLahir;
//     data['jenis_kelamin'] = jenisKelamin;
//     data['role_name'] = roleName;
//     return data;
//   }
// }
