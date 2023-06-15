enum AuthFromRoute {
  cart,
  profile,
}

abstract class AuthNavigation {
  /// É chamado para decidir o que fazer após o usuário se autenticar.
  /// Vale para login, registro e recuperação de senha.
  onAuth(AuthFromRoute from);
}
