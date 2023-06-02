class User {
  final String id;
  final String name;
  final String score;
  bool activist;
  final String poster;

  User(
      {required this.id,
      required this.name,
      required this.score,
      required this.activist,
      required this.poster});

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        score = json["score"],
        activist = json["activist"],
        poster = json["poster"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "score": score,
        "activist": activist,
        "poster": poster,
      };
}
