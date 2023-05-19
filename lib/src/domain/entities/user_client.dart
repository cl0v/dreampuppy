// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserClient {
  
  String id;
  String nome;
  List<String> favorites;

  UserClient({
    required this.id,
    required this.nome,
    this.favorites = const []
  });

  bool isFavorite(String id) => favorites.contains(id);
  // Endereço
  // Cartões cadastrados
  //TODO: Lista de documentos necessários para concluir cadastro.
}