import 'package:dreampuppy/data.dart';
import 'package:dreampuppy/main_app.module.dart';
import 'package:dreampuppy/src/modules/breed/breeds.module.dart';
import 'package:dreampuppy/src/modules/breed/presenter/view/breed_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  setUp(() {
    initModule(
      AppModule(),
    );
    initModule(
      BreedsModule(),
    );
  });
  patrolTest(
    'Should show a breed card',
    (PatrolTester p) async {
      await p.pumpWidget(const MaterialApp(home: BreedListPage()));
      // expect(p(#breedcard), findsAtLeastNWidgets(4));
      // await p.scrollUntilExists(finder: p(#breedsurveycard));
      // expect(p(#breedsurveycard), findsOneWidget);
      // expect(p('-1'), findsNothing);

      // await p(Icons.remove).tap();

      // expect(p('0'), findsNothing);
      // expect(p('-1'), findsOneWidget);
    },
  );
}
