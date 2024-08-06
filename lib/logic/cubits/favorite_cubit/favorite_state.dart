import 'package:subspace_blog/data/model/blog_model.dart';

abstract class FavoriteBlogsState {
  final List<BlogModel> favoriteBlogs;

  FavoriteBlogsState(this.favoriteBlogs);

  get blogs => null;
}

class FavoriteBlogsInitialState extends FavoriteBlogsState {
  FavoriteBlogsInitialState() : super([]);
}

class FavoriteBlogsLoadingState extends FavoriteBlogsState {
  FavoriteBlogsLoadingState(super.favoriteBlogs);
}

class FavoriteBlogsLoadedState extends FavoriteBlogsState {
  FavoriteBlogsLoadedState(super.favoriteBlogs);
}

class FavoriteBlogsErrorState extends FavoriteBlogsState {
  final String message;

  FavoriteBlogsErrorState(this.message, super.favoriteBlogs);
}
