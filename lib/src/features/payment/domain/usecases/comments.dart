import '../../infra/repositories/rate.dart';

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
