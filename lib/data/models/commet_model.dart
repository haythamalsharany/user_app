class CommentRateModel {
  String? commentRateId;
  String? commentRateRating;
  String? commentRateComment;
  String? commentRateDate;
  String? commentRateuUserName;
  String? commentRateUserEmail;
  String? commentRateUserId;
  String? commentRateItemId;

  CommentRateModel(
      {
        this.commentRateId,
        this.commentRateRating,
        this.commentRateComment,
        this.commentRateDate,
        this.commentRateuUserName,
        this.commentRateUserEmail,
        this.commentRateItemId,
        
      });

  CommentRateModel.fromJson(Map<String, dynamic> json) {
    commentRateId = json['items_rating_id'];
    commentRateRating = json['items_rating_rate'];
    commentRateComment = json['items_rating_comment'];
    commentRateDate = json['items_rating_item_date'];
    commentRateuUserName = json['user_name'];
    commentRateUserEmail = json['user_email'];
    commentRateUserId = json['user_id'];
    commentRateItemId = json['items_rating_item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_rating_id'] = commentRateId;
    data['items_rating_rate'] = commentRateRating;
    data['items_rating_comment'] = commentRateComment;
    data['items_rating_item_date'] = commentRateDate;
    data['user_name'] = commentRateuUserName;
    data['user_email'] = commentRateUserEmail ;
    data['items_rating_item_id'] = commentRateItemId;
    return data;
  }
}
