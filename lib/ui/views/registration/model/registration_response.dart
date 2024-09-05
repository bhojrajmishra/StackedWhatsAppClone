class RegistrationResponse {
  final String fullName;
  final String email;
  final int id;
  final String token;
  final bool isStaff;
  final List<String> roles;
  final Map<String, dynamic> organizations;

  RegistrationResponse({
    required this.fullName,
    required this.email,
    required this.id,
    required this.token,
    required this.isStaff,
    required this.roles,
    required this.organizations,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      fullName: json['full_name'],
      email: json['email'],
      id: json['id'],
      token: json['token'],
      isStaff: json['is_staff'],
      roles: List<String>.from(json['roles']),
      organizations: json['organizations'],
    );
  }
}
