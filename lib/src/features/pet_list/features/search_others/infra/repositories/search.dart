import '../datasources/search.dart';

abstract class SearchRepository {
  Future<void> saveSearch(String search);
}

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);


  @override
  Future<void> saveSearch(String search) async {
    return dataSource.saveSearch(search);
  }
}