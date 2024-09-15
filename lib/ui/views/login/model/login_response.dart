class LoginResponse {
  final String email;
  final int password;

  LoginResponse({
    required this.email,
    required this.password,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      email: json['email'] ?? '',
      password: json['password'] ?? 0,
    );
  }
}
