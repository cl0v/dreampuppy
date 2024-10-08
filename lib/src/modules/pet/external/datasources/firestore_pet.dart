import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreampuppy/src/modules/pet/domain/details/entities/pet.dart';
import 'package:dreampuppy/src/utils/collections_prefix.dart';
import '../../infra/datasources/pet_datasource.dart';

class FirestorePetDataSourceImpl implements IPetDataSource {
  final FirebaseFirestore firestore;

  FirestorePetDataSourceImpl(this.firestore);

  @override
  Stream<Pet> fetchPetByID(String id) async* {
    //TODO: Tratar erros de falha de conexão.
    final r = await firestore.getCollection('pets').doc(id).get();
    // .snapshots()
    // .map((snapshot) => Pet.fromJson(snapshot.data()!));
    if (r.data() == null) {
      //TODO: Caso seja um pet não encontrado, permitir o user voltar para a home.
      //TODO: Para isso preciso me comunicar por tipos ou por códigos.
      yield* Stream.error('Filhote não encontrado.');
      return;
    }
    final r1 = Pet.fromJson(r.data()!);
    yield* Future.value(r1).asStream();
  }
}

class MockedPetDataSourceI implements IPetDataSource {
  @override
  Stream<Pet> fetchPetByID(String id) async* {
    yield mockedPet;
  }

  final Pet mockedPet = Pet(
    id: 'xyz',
    coverImgUrl: "https://wallpapers.com/images/featured/wj7msvc5kj9v6cyy.jpg",
    breed: 'Golden Retriever',
    gender: PetGender.male,
    description:
        "Um verdadeiro ladrão de chinelos, não pode dar bobeira que você sempre vai achar seu chinelo em cima do sofá.",
    // "O filhote mais alegre da ninhada. Pode ter certeza que você se divertirá muito com essa fofura. Está sempre andando para os lados procurando alguém pra brincar."
    price: 3500,
    birthDate: DateTime(2021, 07, 31, 18, 09),
    images: [
      "https://wallpapers.com/images/featured/wj7msvc5kj9v6cyy.jpg",
      "https://www.estadao.com.br/resizer/naN2ELW2qMChAySxNYaHeA0fVaA=/1200x1200/filters:format(jpg):quality(80):focal(-5x-5:5x5)/cloudfront-us-east-1.images.arcpublishing.com/estadao/NR644VELJJPNRHWB7SX2HHH3YU.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/20200731_180910_200731.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4051_200803.jpg",
    ],
  );
}
