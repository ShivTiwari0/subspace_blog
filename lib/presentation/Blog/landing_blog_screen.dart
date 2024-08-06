import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_blog/core/extension.dart';
import 'package:subspace_blog/core/ui.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_state.dart';
import 'package:subspace_blog/presentation/Blog/blog_detail_screen.dart';
import 'package:subspace_blog/presentation/favorites/favorite.dart';

class LandingBlogScreen extends StatefulWidget {
  const LandingBlogScreen({super.key});

  static const routeName = "landingBlog";

  @override
  State<LandingBlogScreen> createState() => _LandingBlogScreenState();
}

class _LandingBlogScreenState extends State<LandingBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blogs and Article",
          style: TextStyles.heading3,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FavoriteBlogsScreen.routeName);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ))
        ],
      ),
      body: BlocBuilder<BlogCubit, BlogState>(
        builder: (context, state) {
          if (state is BlogLoadingState && state.blogs.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BlogErrorState && state.blogs.isEmpty) {
            return Center(
              child: Text(state.message.toString()),
            );
          }
          return ListView.builder(
            itemCount: state.blogs.length,
            itemBuilder: (context, index) {
              final product = state.blogs[index];

              return CupertinoButton(
                onPressed: () {
                  Navigator.pushNamed(context, BlogDetailScreen.routeName,
                      arguments: product);
                },
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      width: context.width() * 0.9,
                      imageUrl: product.imageUrl!,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${product.title}",
                          style: TextStyles.body2
                              .copyWith(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
