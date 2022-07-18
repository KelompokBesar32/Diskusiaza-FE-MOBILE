class ResponseResultComment {
  dynamic comment;

  ResponseResultComment({this.comment});

  ResponseResultComment.fromJson(Map<String, dynamic> json) {
    if (json['comment'] != null) {
      comment = <Comment>[];
      json['comment'].forEach((v) {
        comment!.add(Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (comment != null) {
      data['comment'] = comment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comment {
  int? id;
  String? isi;
  String? file;
  String? authorName;
  List<ReplyCommentDetail>? replyCommentDetail;

  Comment(
      {this.id, this.isi, this.file, this.authorName, this.replyCommentDetail});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isi = json['isi'];
    file = json['file'];
    authorName = json['author_name'];
    if (json['reply_comment_detail'] != null) {
      replyCommentDetail = <ReplyCommentDetail>[];
      json['reply_comment_detail'].forEach((v) {
        replyCommentDetail!.add(ReplyCommentDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isi'] = isi;
    data['file'] = file;
    data['author_name'] = authorName;
    if (replyCommentDetail != null) {
      data['reply_comment_detail'] =
          replyCommentDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReplyCommentDetail {
  int? id;
  String? isi;
  String? file;
  String? authorName;

  ReplyCommentDetail({this.id, this.isi, this.file, this.authorName});

  ReplyCommentDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isi = json['isi'];
    file = json['file'];
    authorName = json['author_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['isi'] = isi;
    data['file'] = file;
    data['author_name'] = authorName;
    return data;
  }
}
