import 'package:subspace_blog/data/model/blog_model.dart';
import 'package:subspace_blog/logic/services/preference.dart';

class FavoriteService {
  Future<List<BlogModel>> loadFavorites(List<BlogModel> blogs) async {
    final favoriteIds = await Preference.getFavorits();
    for (var blog in blogs) {
      blog.isFavorite = favoriteIds.contains(blog.id);
    }
    return blogs;
  }

  Future<void> toggleFavorite(String blogId, bool isFavorite) async {
    await Preference.saveFavorite(blogId, isFavorite);
  }
}
