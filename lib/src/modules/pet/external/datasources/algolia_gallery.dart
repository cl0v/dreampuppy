import 'package:algolia/algolia.dart';
import 'package:dreampuppy/src/utils/collections_prefix.dart';
import '../../domain/gallery/entities/gallery.dart';
import '../../infra/datasources/gallery_datasource.dart';

class AlogliaGalleryDatasourceI implements IGalleryDatasource {
  AlogliaGalleryDatasourceI(this.algolia);

  final Algolia algolia;

  @override
  Future<List<GalleryEntity>> populateGallery() async {
    final query = algolia.getCollection('pets');

    print("TODO: Implementar o populate da galeria");

    // final result = await query.getObjects();
    // final pets = result.hits.map((e) => Pet.fromJson(e.data)).toList();
    return [];
  }
}

class MockedGalleryDatasourceI implements IGalleryDatasource {
  final randomImages = {
    ...[
      "https://wallpapers.com/images/featured/wj7msvc5kj9v6cyy.jpg",
      "https://www.estadao.com.br/resizer/naN2ELW2qMChAySxNYaHeA0fVaA=/1200x1200/filters:format(jpg):quality(80):focal(-5x-5:5x5)/cloudfront-us-east-1.images.arcpublishing.com/estadao/NR644VELJJPNRHWB7SX2HHH3YU.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/20200731_180910_200731.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4365_200807.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4525_200809.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4928_200816.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4500_200808.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4904_200816.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4650_200812.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4459-Edit_200808.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_2358.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_238.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_2408.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_280.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4051_200803.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_473.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_5.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_5452.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_5544.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4068_200803.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_5655.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_5709.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_5893.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_7588.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_816.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/Z6A_4193-Edit-Edit_200806.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_3869.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_3360.jpg",
      "https://images.dog.ceo/breeds/retriever-golden/n02099601_3388.jpg"
    ],
    'https://wallpapers.com/images/featured/wj7msvc5kj9v6cyy.jpg',
    'https://www.estadao.com.br/resizer/naN2ELW2qMChAySxNYaHeA0fVaA=/1200x1200/filters:format(jpg):quality(80):focal(-5x-5:5x5)/cloudfront-us-east-1.images.arcpublishing.com/estadao/NR644VELJJPNRHWB7SX2HHH3YU.jpg',
    "https://images.dog.ceo/breeds/retriever-golden/20200731_180910_200731.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4051_200803.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4068_200803.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4193-Edit-Edit_200806.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4365_200807.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4459-Edit_200808.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4500_200808.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4525_200809.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4650_200812.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4904_200816.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_4928_200816.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2358.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_238.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2408.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_280.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3666.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_4256.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_4312.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_473.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5160.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5188.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_544.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5452.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5453.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5544.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5655.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5679.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5709.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5736.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5764.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5857.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5876.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5893.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6099.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6105.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6139.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6194.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6318.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6331.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6577.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_67.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6772.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6814.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6820.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6867.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_6980.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_70.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7019.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7037.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7119.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7123.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7227.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7304.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7312.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7432.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7437.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7588.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7654.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7706.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7709.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7744.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7771.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7780.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7803.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7807.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7916.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7930.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_7993.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_8005.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_816.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_8181.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_825.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_831.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_8429.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_846.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_864.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_8764.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_9153.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_9301.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_9504.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_9518.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/nina.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/sasha2_delgado.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/sasha3_delgado.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/sasha_delgado.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/20200816_180945_200816.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/golden-1.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/joey_20210311_213829.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/joey_20210802_223302.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/joey_20210805_130226.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/joey_IMG_0261.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/joey_IMG_0628.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/joey_IMG_0633.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/joey_IMG_20210906_091617_3.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/leo_small.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_10.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_100.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1010.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1028.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_109.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1162.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_118.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_124.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1249.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1259.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1324.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_14.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1442.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1454.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_146.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1580.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1633.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1743.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_176.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_1768.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2029.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_215.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2295.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2359.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2422.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2440.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2495.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2536.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2663.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2688.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2691.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2796.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_281.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3004.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3007.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_304.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3073.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_308.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3097.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3111.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3720.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3262.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/20200801_174527_200801.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3869.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_569.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5642.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_4241.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3327.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3738.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_4651.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3360.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3569.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3388.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3414.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_345.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_3494.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_4843.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_4933.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5051.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/20200816_163418_200816.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_5132.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/20200814_113907_200814.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/20200814_163629_200814.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_342.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_2994.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/dogs.boris.jasper.nixon.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_447.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/Z6A_3963_200731.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_4678.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_4005.jpg",
    "https://images.dog.ceo/breeds/retriever-golden/n02099601_286.jpg",
  }.toList();

  @override
  Future<List<GalleryEntity>> populateGallery() async => randomImages
      .map<GalleryEntity>(
        (e) => GalleryEntity(
          id: e,
          petId: 'xyz',
          imgUrl: e,
        ),
      )
      .toList();
}
