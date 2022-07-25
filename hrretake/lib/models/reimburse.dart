class Reimburse {
  String id;
  final String subject;
  final String afr;
  final String description;
  final String email;

  //amount for reimbursement = afr
  Reimburse({
    this.id ='',
    required this.subject,
    required this.afr,
    required this.description,
    required this.email
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'subject': subject,
    'afr': afr,
    'description' : description,
    'email' : email
  };

  static Reimburse fromJson(Map<String, dynamic> json) => Reimburse(
      id: json['id'],
      subject: json['subject'],
      afr: json['afr'],
      description: json['description'],
      email: json['email']
  );
}