import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../stores/achievements_screen/achievements_screen_store.dart';

class AchievementsScreen extends StatelessWidget {
  AchievementsScreen({super.key}) : store = AchievementsScreenStore();

  final AchievementsScreenStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ачивки'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: Observer(
        builder: (_) {
          final achievements = store.achievements;

          if (achievements.isEmpty) {
            return const _EmptyState();
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: achievements.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final a = achievements[i];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                leading: _Thumb(url: a.imageUrl),
                title: Text(
                  a.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  a.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(
                  a.isUnlocked ? Icons.verified : Icons.lock_outline,
                  color: a.isUnlocked ? Colors.green : null,
                ),
                onTap: () {
                  // Можно добавить логику открытия деталей ачивки
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  final String url;
  const _Thumb({required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: url,
        width: 72,
        height: 72,
        fit: BoxFit.cover,
        placeholder: (c, _) => const SizedBox(
          width: 72,
          height: 72,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        errorWidget: (c, _, __) => const SizedBox(
          width: 72,
          height: 72,
          child: Icon(Icons.broken_image),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Text('Ачивок пока нет'),
      ),
    );
  }
}

