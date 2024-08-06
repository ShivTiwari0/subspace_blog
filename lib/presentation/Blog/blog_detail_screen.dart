import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subspace_blog/core/ui.dart';
import 'package:subspace_blog/data/model/blog_model.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_state.dart';

class BlogDetailScreen extends StatefulWidget {
  final BlogModel blog;
  const BlogDetailScreen({super.key, required this.blog});

  static const routeName = "BlogDetail";

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.blog.title ?? "No title found"),
        actions: [BlocBuilder<BlogCubit, BlogState>(
            builder: (context, state) {
              if (state is BlogLoadedState) {
                final blog = state.blogs.firstWhere((blog) => blog.id == widget.blog.id);
                return IconButton(
                  icon: Icon(
                    blog.isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  onPressed: () {
                    context.read<BlogCubit>().toggleFavorite(widget.blog.id!);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(width: 10),
         
        ],
      ),
      body: SafeArea(
        child: ListView( 
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: widget.blog.imageUrl!,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.blog.title}",
                    style: TextStyles.heading3, 
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${widget.blog.id}",
                    style: TextStyles.body1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
