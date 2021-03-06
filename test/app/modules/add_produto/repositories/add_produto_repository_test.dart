import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:store_hasura/app/modules/add_produto/repositories/add_produto_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  AddProdutoRepository repository;

  setUp(() {
    repository = AddProdutoRepository(null);
  });

  group('AddProdutoRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<AddProdutoRepository>());
    });
  });
}
