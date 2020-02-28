import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'package:store_hasura/app/modules/home/repositories/home_repository.dart';

class MockClient extends Mock implements Dio {}

void main() {
  HomeRepository repository;

  setUp(() {});

  group('HomeRepository Test', () {
    test("First Test", () {
      expect(repository, isInstanceOf<HomeRepository>());
    });
  });
}
