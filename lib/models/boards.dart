class Board {
  late String id;
  late String id_user;
  late String titre;
  late int idd;

  Board({
    required this.id,
    required this.id_user,
    required this.titre,
    required this.idd,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'id_user': id_user,
    'titre': titre,
    'idd': idd,
  };

  static Board fromJson(Map<String, dynamic> json) => Board(
    id: json['id'],
    id_user: json['id_user'],
    titre: json['titre'],
    idd: json['idd'],
  );
}
