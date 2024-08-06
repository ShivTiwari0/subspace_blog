import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:subspace_blog/core/ui.dart';

import 'package:subspace_blog/logic/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:subspace_blog/logic/cubits/favorite_cubit/favorite_state.dart';
import 'package:subspace_blog/presentation/Blog/blog_detail_screen.dart';

class FavoriteBlogsScreen extends StatelessWidget {

  static const routeName = "favorite";

  const FavoriteBlogsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Blogs'),
      ),
      body: BlocBuilder<FavoriteBlogsCubit, FavoriteBlogsState>(
        builder: (context, state) {
          if (state is FavoriteBlogsLoadingState) {
            return  Center(child: Lottie.asset(
            'assets/animated/Animation - 1722927455635.json', fit: BoxFit.fitHeight),);
          } else if (state is FavoriteBlogsLoadedState) {
            return ListView.builder(
              itemCount: state.favoriteBlogs.length,
              itemBuilder: (context, index) {
                final blog = state.favoriteBlogs[index];
                return ListTile(onTap: () {
                   Navigator.pushNamed(context, BlogDetailScreen.routeName,
                      arguments: blog);
                },
                  title: Text(blog.title ?? 'No Title', style: TextStyles.body2, ),
                  leading: blog.imageUrl != null
                      ? CachedNetworkImage(imageUrl: blog.imageUrl!,)
                      : null,trailing: Icon(Icons.menu,color: AppColors.lightGreyTextColor,),
                     
                );
              },
            );
          } else if (state is FavoriteBlogsErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No favorites found'));
          }
        },
      ),
    );
  }
}
