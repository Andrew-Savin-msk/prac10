import 'package:mobx/mobx.dart';
import '../models/faq_item_model.dart';
import '../services/support_service.dart';

part 'support_screen_store.g.dart';

class SupportScreenStore = _SupportScreenStoreBase with _$SupportScreenStore;

abstract class _SupportScreenStoreBase with Store {
  _SupportScreenStoreBase(this._service) {
    loadFaq();
  }

  final SupportService _service;

  @observable
  ObservableList<FaqItem> faqItems = ObservableList.of([]);

  @computed
  bool get hasFaq => faqItems.isNotEmpty;

  @action
  void loadFaq() {
    final items = _service.getFaqItems();
    faqItems = ObservableList.of(items);
  }
}

