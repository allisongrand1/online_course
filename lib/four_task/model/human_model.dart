class HumanModel {
  final String id;
  final String name;
  final String telephone;
  final String poster;
  HumanModel(
      {required this.id,
      required this.name,
      required this.telephone,
      required this.poster});

  HumanModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          telephone: json['telephone'],
          poster: json['poster'],
        );
}
