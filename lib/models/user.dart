class Users {
  late String id;
  late String nom;
  late String prenom;
  late String photo;
  late String email;
  late String date_de_naissance;
  late String username;

  Users(this.id, this.nom, this.prenom, this.photo, this.date_de_naissance,
      this.username, this.email);

  Map<String, dynamic> toJson() => {
    'id': id,
    'nom': nom,
    'prenom': prenom,
    'photo': photo,
    'email': email,
    'date_de_naissance': date_de_naissance,
    'username': username
  };

  static Users fromJson(Map<String, dynamic> json) => Users(
      json['id'],
      json['nom'],
      json['prenom'],
      json['photo'],
      json['email'],
      json['date_de_naissance'],
      json['username']
  );
}
