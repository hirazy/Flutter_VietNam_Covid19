abstract class AuthRepository{

  Future<void> authenticate(String username, String password, String url);

  Future<void> login(String username, String password);

  Future<void> signup(String username, String password);

  Future<void> logout();
}