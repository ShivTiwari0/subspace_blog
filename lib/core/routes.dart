import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subspace_blog/data/model/blog_model.dart';
import 'package:subspace_blog/presentation/Blog/blog_detail_screen.dart';
import 'package:subspace_blog/presentation/Blog/landing_blog_screen.dart';
import 'package:subspace_blog/presentation/favorites/favorite.dart';
import 'package:subspace_blog/presentation/splash/splash_screen.dart';

class Routes {
  static Route? onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LandingBlogScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const LandingBlogScreen());
      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      case BlogDetailScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlogDetailScreen(
                  blog: settings.arguments as BlogModel,
                ));
                 case FavoriteBlogsScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const FavoriteBlogsScreen());
      default:
        return null;
    }
  }
}
