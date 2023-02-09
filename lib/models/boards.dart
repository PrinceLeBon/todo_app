class Board_Model {
  late String id;
  late String id_user;
  late String titre;
  late String couleur;
  late List<String> listOfAssignee;
  late int idd;

  Board_Model({
    required this.id,
    required this.id_user,
    required this.titre,
    required this.couleur,
    required this.listOfAssignee,
    required this.idd,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'id_user': id_user,
    'titre': titre,
    'couleur': couleur,
    'listOfAssignee': listOfAssignee,
    'idd': idd,
  };

  static Board_Model fromJson(Map<String, dynamic> json) => Board_Model(
    id: json['id'],
    id_user: json['id_user'],
    titre: json['titre'],
    couleur: json['couleur'],
    listOfAssignee: List<String>.from(json['listOfAssignee']),
    idd: json['idd'],
  );
}
