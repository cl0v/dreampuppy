import '../../infra/repositories/rate.dart';

/// Quando o user tocar para ir para a avaliação na loja, ou ir para o WhatsApp,
/// Esse usecase será disparado, informando qual dos botões foi acionado,
/// enviando também o conteúdo do campo de comentário
abstract class SendCommentUseCase {
  /// O [from] se refere ao tipo de botão que foi acionado para enviar o comentário em questão.
  /// no DS ficará registrado como "from_str" ou "from_wpp"
  call(String from, String comment);
}

class SendCommentUseCaseImpl implements SendCommentUseCase {
  final RateRepository repository;

  SendCommentUseCaseImpl(this.repository);

  @override
  call(String comment, String from) {
    return repository.comment(from, comment);
  }
}
