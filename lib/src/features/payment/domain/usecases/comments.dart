abstract class SendCommentUseCase {
  /// O [from] se refere ao tipo de botão que foi acionado para enviar o comentário em questão.
  /// no DS ficará registrado como "from_str" ou "from_wpp"
  call(String comment, String from);
}

class SendCommentUseCaseImpl implements SendCommentUseCase {
  @override
  call(String comment, String from) {
    print("$from: $comment");
  }
}