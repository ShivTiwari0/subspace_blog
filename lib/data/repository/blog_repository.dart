import 'dart:developer';
import 'package:subspace_blog/logic/services/hive/hive_blog_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:subspace_blog/core/api.dart';
import 'package:subspace_blog/data/model/blog_model.dart';

class BlogRepository {
  final _api = Api();

  Future<List<BlogModel>> getAllBlogs() async {
    try {
      Response response = await _api.sendRequest.get("rest/blogs");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (response.statusCode == 200) {
        List<BlogModel> blogs = (apiResponse.data as List<dynamic>)
            .map((json) => BlogModel.fromJson(json))
            .toList();
      
        final box = Hive.box<HiveBlogModel>('blogBox'); // Access the already opened box
        log("Accessed Hive box successfully");
        for (var blog in blogs) {
          final hiveBlog = HiveBlogModel.fromJson(blog.toJson());
          await box.put(hiveBlog.id, hiveBlog);
        }

        return blogs;
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e, stacktrace) {
      log('Error fetching blogs: $e');
      log('Stacktrace: $stacktrace');
  try {
        final box = Hive.box<HiveBlogModel>('blogBox'); // Access the already opened box
        log('Accessed Hive box on error');
        return box.values.map((hiveBlog) => BlogModel.fromJson(hiveBlog.toJson())).toList();
      } catch (e) {
        log('Error accessing box on error: $e');
        rethrow;
      }
    }
  }
}
