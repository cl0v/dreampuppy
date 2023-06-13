// import 'package:dio/dio.dart';
// import 'package:dreampuppy/pet_mock.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class DioMock extends Mock implements Dio {}

// void main() {
//   final mockedDio = DioMock();

//   setUp(() {
//     when(() => mockedDio.get(any())).thenAnswer((invocation) => Future.value(
//         Response(data: json, statusCode: 200, requestOptions: RequestOptions())));
//   });
//   testWidgets('pet mock ...', (tester) async {
//     final list = await PetMockHelper(mockedDio).fetchBreedImages();
//     expect(list.length, 198);
//   });
// }

// final json = {
//   "message": [
//     "https://images.dog.ceo/breeds/shihtzu/Rudy_Small.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1011.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1016.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1059.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1078.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_10785.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_110.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_11085.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_11139.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1142.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_11622.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_11692.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1170.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_11766.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_11959.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_12003.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1205.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_12057.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1215.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_12314.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_12315.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_12342.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_12348.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_12480.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1249.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1259.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_126.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_12650.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_12796.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1295.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1333.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_134.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_135.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1366.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1370.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1445.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1621.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1665.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1687.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1690.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1725.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1770.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1779.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1843.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1856.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1859.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1874.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1927.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_1958.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2003.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2077.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2113.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2211.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2254.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2335.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2417.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2526.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_254.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2705.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_271.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2710.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_272.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_2961.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_30.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3050.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_306.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3094.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3137.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3175.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3186.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3217.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3227.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_323.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3254.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3424.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3489.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3493.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3558.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3582.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3719.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3738.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3802.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3814.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3827.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3862.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3921.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3961.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3979.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_3983.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4127.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_415.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4190.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4252.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4255.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4346.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4430.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4449.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_447.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4544.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_46.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4608.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4625.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4629.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4669.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4751.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4776.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4808.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4865.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_4999.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5042.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5096.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5140.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5246.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5316.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_533.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5352.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5443.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5536.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5541.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5546.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5554.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5627.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5696.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5703.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_574.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5889.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5957.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5976.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_599.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_5994.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6032.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6082.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_61.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6106.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6116.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6131.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6222.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6269.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6322.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6323.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_646.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6463.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6477.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6585.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6587.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6606.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6647.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6795.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6819.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6833.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6849.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6871.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6882.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6898.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6911.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_6992.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_707.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7093.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7100.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7110.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7123.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7170.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7205.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7207.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7209.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7221.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7248.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7266.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7299.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7349.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_739.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7404.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_745.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7454.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_756.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_762.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7728.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_788.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_789.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_7954.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_8017.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_8108.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_818.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_8205.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_8489.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_8812.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_8825.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_9.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_9098.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_9293.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_936.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_9429.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_9467.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_9551.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_963.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_968.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/n02086240_9750.jpg",
//     "https://images.dog.ceo/breeds/shihtzu/oscar.jpg",
//   ],
//   "status": "success"
// };
