abstract class AppRatingServiceDataSource {

  Future<void> rate({
    /// Qual feature o usuário está avaliando
    required String feature,

    /// Qual a avaliação do usuário
    required int rating,
  });

  /// Comentário de avaliação do usuário
  Future<void> comment(
    /// Qual o botão apertado para enviar o comentário
    String from,
    /// O comentário é salvo enviando também o btnPressed.comment
    String comment,
  );
}
