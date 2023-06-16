enum AuthFromRoute {
  cart,
  profile,
}

abstract class AuthNavigation {
  /// É chamado para decidir o que fazer após o usuário se autenticar.
  onLogin(String email, String uuid);

  /// É chamado após o user se cadastrar no Auth
  onRegister(String email, String uuid);
}
