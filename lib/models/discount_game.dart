import 'dart:convert';

List<DiscountGameModel> discountGameModelFromMap(String str) =>
    List<DiscountGameModel>.from(
        json.decode(str).map((x) => DiscountGameModel.fromMap(x)));

String discountGameModelToMap(List<DiscountGameModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class DiscountGameModel {
  DiscountGameModel({
    this.id = 0,
    this.title = "Not found",
    this.worth = "Not found",
    this.thumbnail = "Not found",
    this.image = "No image",
    this.description = "Not found",
    this.instructions = "Not found",
    this.openGiveawayUrl = "Not found",
    this.publishedDate = "Not found",
    this.type = "Not found",
    this.platforms = "Not found",
    this.endDate = "Not found",
    this.users = 0,
    this.status = "Not found",
    this.gamerpowerUrl = "Not found",
    this.openGiveaway = "Not found",
  });

  int id;
  String title;
  String worth;
  String thumbnail;
  String image;
  String description;
  String instructions;
  String openGiveawayUrl;
  String publishedDate;
  String type;
  String platforms;
  String endDate;
  int users;
  String status;
  String gamerpowerUrl;
  String openGiveaway;

  factory DiscountGameModel.fromMap(Map<String, dynamic> json) =>
      DiscountGameModel(
        id: json["id"],
        title: json["title"],
        worth: json["worth"],
        thumbnail: json["thumbnail"],
        image: json["image"],
        description: json["description"],
        instructions: json["instructions"],
        openGiveawayUrl: json["open_giveaway_url"],
        publishedDate: json["published_date"],
        type: json["type"],
        platforms: json["platforms"],
        endDate: json["end_date"],
        users: json["users"],
        status: json["status"],
        gamerpowerUrl: json["gamerpower_url"],
        openGiveaway: json["open_giveaway"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "worth": worth,
        "thumbnail": thumbnail,
        "image": image,
        "description": description,
        "instructions": instructions,
        "open_giveaway_url": openGiveawayUrl,
        "published_date": publishedDate,
        "type": type,
        "platforms": platforms,
        "end_date": endDate,
        "users": users,
        "status": status,
        "gamerpower_url": gamerpowerUrl,
        "open_giveaway": openGiveaway,
      };
}
// class DiscountGameModel {
//   int userId;
//   int id;
//   String title;
//   String body;

//   DiscountGameModel({
//     this.userId = 0,
//     this.id = 0,
//     this.title = "no title",
//     this.body = "no body",
//   });

//   //from json to model
//   factory DiscountGameModel.fromMap(Map<String, dynamic> map) {
//     return DiscountGameModel(
//       userId: map['userId'],
//       id: map['id'],
//       title: map['title'],
//       body: map['body'],
//     );
//   }

//   //from model to json
//   //toMap()
// }
