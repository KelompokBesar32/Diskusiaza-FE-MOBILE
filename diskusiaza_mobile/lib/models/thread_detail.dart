class ResponseResultThreadDetail {
  dynamic data;

  ResponseResultThreadDetail({this.data});

  ResponseResultThreadDetail.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ThreadDetail.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ThreadDetail {
  int? id;
  String? judul;
  String? isi;
  String? file;
  int? dilihat;
  String? status;
  String? kategoriName;
  String? authorName;
  String? ruangName;
  int? totalLike;
  bool? isLike;
  String? createdAt;
  String? updatedAt;

  ThreadDetail(
      {this.id,
      this.judul,
      this.isi,
      this.file,
      this.dilihat,
      this.status,
      this.kategoriName,
      this.authorName,
      this.ruangName,
      this.totalLike,
      this.isLike,
      this.createdAt,
      this.updatedAt});

  ThreadDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    isi = json['isi'];
    file = json['file'];
    dilihat = json['dilihat'];
    status = json['status'];
    kategoriName = json['kategori_name'];
    authorName = json['author_name'];
    ruangName = json['ruang_name'];
    totalLike = json['total_like'];
    isLike = json['is_like'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['judul'] = judul;
    data['isi'] = isi;
    data['file'] = file;
    data['dilihat'] = dilihat;
    data['status'] = status;
    data['kategori_name'] = kategoriName;
    data['author_name'] = authorName;
    data['ruang_name'] = ruangName;
    data['total_like'] = totalLike;
    data['is_like'] = isLike;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
