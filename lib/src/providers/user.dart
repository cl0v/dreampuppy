class UserProvider {
  //TODO: Receber o usuário e manter a instancia dele sempre ativa. Não fazer verificações por aqui, apenas usar para resgatar o user
  String? id;

  /// Pode ser null, caso o user tenha selecionado forma de pagamento 
  /// em Pix, ou claro, o user ainda não tem cadastro.
  /// Quando o user cadastra o cartão, ou seleciona um, esse valor é setado.
  String? defaultCardToken;
  /// Resumo do endereço do usuário para ser exibido na tela de pagamento.
  String? addressResume;
}
