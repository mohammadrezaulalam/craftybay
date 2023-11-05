import 'package:craftybay/data/models/wishlist_data.dart';

class ProductReviewListModel {
  String? msg;
  List<WishListData>? data;

  ProductReviewListModel({this.msg, this.data});

  ProductReviewListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <WishListData>[];
      json['data'].forEach((v) {
        data!.add(WishListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

