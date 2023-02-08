class Task_Model {
  late String id;
  late String id_board;
  late String id_user;
  late String titre;
  late String description;
  late String etat;
  late DateTime date_de_creation;
  late DateTime date_pour_la_tache;
  late String heure_pour_la_tache;
  //late int idd;

  Task_Model({
    required this.id,
    required this.id_board,
    required this.id_user,
    required this.titre,
    required this.description,
    required this.etat,
    required this.date_de_creation,
    required this.date_pour_la_tache,
    required this.heure_pour_la_tache,
   // required this.idd,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_board': id_board,
        'id_user': id_user,
        'titre': titre,
        'description': description,
        'etat': etat,
        'date_de_creation': date_de_creation,
        'date_pour_la_tache': date_pour_la_tache,
        'heure_pour_la_tache': heure_pour_la_tache,
        //'idd': idd,
      };

  static Task_Model fromJson(Map<String, dynamic> json) => Task_Model(
        id: json['id'],
        id_board: json['id_board'],
        id_user: json['id_user'],
        titre: json['titre'],
        description: json['description'],
        etat: json['etat'],
        date_de_creation: json['date_de_creation'],
        date_pour_la_tache: json['date_pour_la_tache'],
        heure_pour_la_tache: json['heure_pour_la_tache'],
     //   idd: json['idd'],
      );
}
