class Board_Model {
  late String id;
  late String id_user;
  late String titre;
  late String couleur;
  late int idd;

  Board_Model({
    required this.id,
    required this.id_user,
    required this.titre,
    required this.couleur,
    required this.idd,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'id_user': id_user,
    'titre': titre,
    'couleur': couleur,
    'idd': idd,
  };

  static Board_Model fromJson(Map<String, dynamic> json) => Board_Model(
    id: json['id'],
    id_user: json['id_user'],
    titre: json['titre'],
    couleur: json['couleur'],
    idd: json['idd'],
  );
}
