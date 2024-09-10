class RegistrationResponse {
  final String fullName;
  final String email;
  final int id;
  final String token;

  RegistrationResponse({
    required this.fullName,
    required this.email,
    required this.id,
    required this.token,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      fullName: json['full_name'],
      email: json['email'],
      id: json['id'],
      token: json['token'],
    );
  }
}
