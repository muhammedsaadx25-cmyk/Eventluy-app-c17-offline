class UserModel {
  static UserModel? loggedInUser;

  String id;
  String name;
  String email;
  List<String> favouriteEventsIds;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.favouriteEventsIds,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json["id"],
        name: json["name"],
        email: json["email"],

        favouriteEventsIds:( json["favouriteEventsIds"] as List<dynamic>).cast<String>()
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "favouriteEventsIds": favouriteEventsIds,
    };
  }
}
