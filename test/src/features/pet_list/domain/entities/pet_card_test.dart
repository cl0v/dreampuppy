import 'package:dreampuppy/src/modules/pet/domain/gallery/entities/pet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Testando se vale a pena criar a entidade com o hash", () {
    final entity = PetCardEntity(imgUrl: "imgUrl", breed: "breed", colorValue: Colors.white.value);

    expect(entity.color.value, 4294967295);
  });
}