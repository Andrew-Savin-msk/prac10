import 'package:mobx/mobx.dart';
import '../models/tip_article_model.dart';
import '../services/tips_service.dart';

part 'tips_list_screen_store.g.dart';

class TipsListScreenStore = _TipsListScreenStoreBase with _$TipsListScreenStore;

abstract class _TipsListScreenStoreBase with Store {
  _TipsListScreenStoreBase(this._service) {
    loadArticles();
  }

  final TipsService _service;

  @observable
  ObservableList<TipArticle> articles = ObservableList.of([]);

  @observable
  String searchQuery = '';

  @computed
  List<TipArticle> get filteredArticles {
    if (searchQuery.trim().isEmpty) return articles.toList();
    final q = searchQuery.toLowerCase().trim();
    return articles
        .where((a) =>
            a.title.toLowerCase().contains(q) ||
            a.shortDescription.toLowerCase().contains(q) ||
            (a.category?.toLowerCase().contains(q) ?? false))
        .toList();
  }

  @computed
  bool get hasArticles => filteredArticles.isNotEmpty;

  @action
  void loadArticles() {
    final list = _service.getAll();
    articles = ObservableList.of(list);
  }

  @action
  void setSearchQuery(String value) {
    searchQuery = value;
  }
}

