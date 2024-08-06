import 'package:subspace_blog/data/model/blog_model.dart';



abstract class BlogState {
  final List<BlogModel> blogs;

  BlogState(this.blogs);
}

class BlogInitialState extends BlogState{
  BlogInitialState():super([]);
  
}
class BlogLoadingState extends BlogState{
  BlogLoadingState(super.blogs);
  
}

class BlogLoadedState extends BlogState{
  BlogLoadedState(super.blogs);
  
}
class BlogErrorState extends BlogState{final String message ;
  BlogErrorState(this.message, super.blogs);
}