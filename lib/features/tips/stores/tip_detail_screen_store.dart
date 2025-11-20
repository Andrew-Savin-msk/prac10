import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:prac10/features/tips/models/tip_article_model.dart';
import 'package:prac10/features/activity_log/services/activity_log_service.dart';

part 'tip_detail_screen_store.g.dart';

class TipDetailScreenStore = _TipDetailScreenStoreBase
    with _$TipDetailScreenStore;

abstract class _TipDetailScreenStoreBase with Store {
  _TipDetailScreenStoreBase(this.article) {
    _logTipOpened();
  }

  final TipArticle article;
  final ActivityLogService _logService = GetIt.I<ActivityLogService>();

  void _logTipOpened() {
    _logService.log(
      type: 'tip_opened',
      title: 'Открыта статья',
      description: article.title,
    );
  }
}

