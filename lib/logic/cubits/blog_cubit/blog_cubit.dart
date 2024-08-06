import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_blog/data/model/blog_model.dart';
import 'package:subspace_blog/data/repository/blog_repository.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_state.dart';
import 'package:subspace_blog/logic/services/preference.dart';

class BlogCubit extends Cubit<BlogState>{
  BlogCubit() : super(BlogInitialState()){
    _initialize();    
  }
  final _repository = BlogRepository();
 

void _initialize()async{
  
  try {
 emit(BlogLoadingState(state.blogs));
 final blogs =await  _repository.getAllBlogs();
 _loadFavorites(blogs);
 emit(BlogLoadedState(blogs));
  } catch (e) {
  emit(BlogErrorState(e.toString(), state.blogs));
  }
}
Future<void> _loadFavorites(List<BlogModel> blogs) async {
    final favoriteIds = await Preference.getFavorits();

    for (var blog in blogs) {
      blog.isFavorite = favoriteIds.contains(blog.id);
    }
  }

  void toggleFavorite(String blogId) async {
    final updatedBlogs = state.blogs.map((blog) {
      if (blog.id == blogId) {
        blog.isFavorite = !blog.isFavorite;
        Preference.saveFavorite(blog.id!, blog.isFavorite);
      }
      return blog;
    }).toList();

    emit(BlogLoadedState(updatedBlogs));
  }

}
