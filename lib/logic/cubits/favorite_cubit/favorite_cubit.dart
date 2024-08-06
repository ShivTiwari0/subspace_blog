import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_blog/data/model/blog_model.dart';
import 'package:subspace_blog/data/repository/blog_repository.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_state.dart';
import 'package:subspace_blog/logic/cubits/favorite_cubit/favorite_state.dart';
import 'package:subspace_blog/logic/services/preference.dart';

class FavoriteBlogsCubit extends Cubit<FavoriteBlogsState> {
  final BlogCubit _blogCubit;
  StreamSubscription? _blogSubscription;
 

  FavoriteBlogsCubit(this._blogCubit) : super(FavoriteBlogsInitialState()) {
    // Initialize the cubit with blog data and start listening to blog state changes
    _blogSubscription = _blogCubit.stream.listen(_onBlogStateChanged);
    _onBlogStateChanged(_blogCubit.state);
  }

  Future<void> _onBlogStateChanged(BlogState state) async {
    if (state is BlogLoadedState) {
      _loadFavoriteBlogs(state.blogs);
    }
  }

  Future<void> _loadFavoriteBlogs(List<BlogModel> blogs) async {
    try {
      emit(FavoriteBlogsLoadingState(state.favoriteBlogs));
      final favoriteIds = await Preference.getFavorits();

      final favoriteBlogs = blogs.where((blog) => favoriteIds.contains(blog.id)).toList();
      emit(FavoriteBlogsLoadedState(favoriteBlogs));
    } catch (e) {
      emit(FavoriteBlogsErrorState(e.toString(), state.favoriteBlogs));
    }
  }

  @override
  Future<void> close() {
    _blogSubscription?.cancel();
    return super.close();
  }
}
