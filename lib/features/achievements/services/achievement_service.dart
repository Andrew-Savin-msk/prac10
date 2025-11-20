import '../models/achievement_model.dart';

class AchievementService {
  List<Achievement> getAchievements() => const [
        Achievement(
          title: 'Первый шаг',
          description: 'Создана первая цель',
          imageUrl: 'https://picsum.photos/id/237/600/400',
          isUnlocked: true,
        ),
        Achievement(
          title: 'Настойчивость',
          description: 'Выполнено 5 целей подряд',
          imageUrl: 'https://picsum.photos/id/1025/600/400',
          isUnlocked: true,
        ),
        Achievement(
          title: 'Мастер планирования',
          description: 'Добавлено 10 подцелей',
          imageUrl: 'https://picsum.photos/id/1011/600/400',
          isUnlocked: false,
        ),
        Achievement(
          title: 'Ежедневная серия',
          description: 'Серия из 7 дней',
          imageUrl: 'https://picsum.photos/id/1003/600/400',
          isUnlocked: false,
        ),
        Achievement(
          title: 'Целеустремлённый',
          description: 'Цель с подцелями',
          imageUrl: 'https://picsum.photos/id/1035/600/400',
          isUnlocked: true,
        ),
        Achievement(
          title: 'Легенда целей',
          description: 'Все цели закрыты',
          imageUrl: 'https://picsum.photos/id/1043/600/400',
          isUnlocked: false,
        ),
      ];
}

