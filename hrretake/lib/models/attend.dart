class Attend {
  String id;
  final String date;
  final String attendance;
  final String email;

  //number days absent = nda
  Attend({
    this.id ='',
    required this.date,
    required this.attendance,
    required this.email
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'description' : attendance,
    'email' : email
  };

  static Attend fromJson(Map<String, dynamic> json) => Attend(
      id: json['id'],
      date: json['date'],
      attendance: json['description'],
      email: json['email']
  );
}