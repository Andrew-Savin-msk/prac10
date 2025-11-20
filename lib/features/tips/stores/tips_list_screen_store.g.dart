// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_list_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TipsListScreenStore on _TipsListScreenStoreBase, Store {
  Computed<List<TipArticle>>? _$filteredArticlesComputed;

  @override
  List<TipArticle> get filteredArticles =>
      (_$filteredArticlesComputed ??= Computed<List<TipArticle>>(
        () => super.filteredArticles,
        name: '_TipsListScreenStoreBase.filteredArticles',
      )).value;
  Computed<bool>? _$hasArticlesComputed;

  @override
  bool get hasArticles => (_$hasArticlesComputed ??= Computed<bool>(
    () => super.hasArticles,
    name: '_TipsListScreenStoreBase.hasArticles',
  )).value;

  late final _$articlesAtom = Atom(
    name: '_TipsListScreenStoreBase.articles',
    context: context,
  );

  @override
  ObservableList<TipArticle> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ObservableList<TipArticle> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$searchQueryAtom = Atom(
    name: '_TipsListScreenStoreBase.searchQuery',
    context: context,
  );

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$_TipsListScreenStoreBaseActionController = ActionController(
    name: '_TipsListScreenStoreBase',
    context: context,
  );

  @override
  void loadArticles() {
    final _$actionInfo = _$_TipsListScreenStoreBaseActionController.startAction(
      name: '_TipsListScreenStoreBase.loadArticles',
    );
    try {
      return super.loadArticles();
    } finally {
      _$_TipsListScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchQuery(String value) {
    final _$actionInfo = _$_TipsListScreenStoreBaseActionController.startAction(
      name: '_TipsListScreenStoreBase.setSearchQuery',
    );
    try {
      return super.setSearchQuery(value);
    } finally {
      _$_TipsListScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
articles: ${articles},
searchQuery: ${searchQuery},
filteredArticles: ${filteredArticles},
hasArticles: ${hasArticles}
    ''';
  }
}
