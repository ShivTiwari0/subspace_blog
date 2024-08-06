import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const String _favorite = 'favorites';
  static Future<List<String>> getFavorits() async {
    final pref = await SharedPreferences.getInstance();
    return  pref.getStringList(_favorite)??[];
  }

  static Future<void> saveFavorite(String blogId, bool isFavorite) async {
    final pref = await SharedPreferences.getInstance();
    final favoriteIds = pref.getStringList(_favorite) ?? [];

    if (isFavorite) {
        if (!favoriteIds.contains(blogId)) {
        favoriteIds.add(blogId);
      }
    } else {
      favoriteIds.remove(blogId);
    }
    await pref.setStringList(_favorite, favoriteIds);
  }
}
