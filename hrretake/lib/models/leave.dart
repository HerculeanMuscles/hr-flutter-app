class Leave {
  String id;
  final String subject;
  final String nda;
  final String description;
  final String email;
  final String status;

  //number days absent = nda
  Leave({
    this.id ='',
    required this.subject,
    required this.nda,
    required this.description,
    required this.email,
    required this.status
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'subject': subject,
    'nda': nda,
    'description' : description,
    'email' : email,
    'status' :  status
  };

  static Leave fromJson(Map<String, dynamic> json) => Leave(
      id: json['id'],
      subject: json['subject'],
      nda: json['nda'],
      description: json['description'],
      email: json['email'],
      status: json['status']
  );
}