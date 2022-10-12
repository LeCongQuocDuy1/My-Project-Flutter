class ItemModel {
  int? id;
  String? title;
  String? description;
  num? price;
  String? category;
  String? image;
  Rating? rating;

  ItemModel(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.category,
        this.image,
        this.rating});

  factory ItemModel.fromjson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  num? rate;
  int? count;
  Rating({this.rate, this.count});
  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json['rate'], count: json['count']);
  }
}
