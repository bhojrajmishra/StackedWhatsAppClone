class LocalStorageService {
  Future<String?> getToken(dynamic loginService) async {
    return await loginService.getToken();
  }
}
