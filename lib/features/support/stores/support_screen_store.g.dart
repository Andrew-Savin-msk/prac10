// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupportScreenStore on _SupportScreenStoreBase, Store {
  Computed<bool>? _$hasFaqComputed;

  @override
  bool get hasFaq => (_$hasFaqComputed ??= Computed<bool>(
    () => super.hasFaq,
    name: '_SupportScreenStoreBase.hasFaq',
  )).value;

  late final _$faqItemsAtom = Atom(
    name: '_SupportScreenStoreBase.faqItems',
    context: context,
  );

  @override
  ObservableList<FaqItem> get faqItems {
    _$faqItemsAtom.reportRead();
    return super.faqItems;
  }

  @override
  set faqItems(ObservableList<FaqItem> value) {
    _$faqItemsAtom.reportWrite(value, super.faqItems, () {
      super.faqItems = value;
    });
  }

  late final _$_SupportScreenStoreBaseActionController = ActionController(
    name: '_SupportScreenStoreBase',
    context: context,
  );

  @override
  void loadFaq() {
    final _$actionInfo = _$_SupportScreenStoreBaseActionController.startAction(
      name: '_SupportScreenStoreBase.loadFaq',
    );
    try {
      return super.loadFaq();
    } finally {
      _$_SupportScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
faqItems: ${faqItems},
hasFaq: ${hasFaq}
    ''';
  }
}
