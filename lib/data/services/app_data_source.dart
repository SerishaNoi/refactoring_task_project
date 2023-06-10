import 'dart:convert';

import 'package:eds_test/data/models/hive_models/hive_album_model.dart';
import 'package:eds_test/data/models/hive_models/hive_album_with_photo_model.dart';
import 'package:eds_test/data/models/hive_models/hive_comment_model.dart';
import 'package:eds_test/data/models/hive_models/hive_photo_model.dart';
import 'package:eds_test/data/models/hive_models/hive_post_model.dart';
import 'package:eds_test/data/models/hive_models/hive_user_model.dart';

import 'package:http/http.dart' as http;

class AppDataSource {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<UserModel>> fetchAllUsers() async {
    const url = '$baseUrl/users/';
    final response = await http.get(Uri.parse(url));
    final usersList = json.decode(response.body) as List;
    final jsonResponse =
        usersList.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();

    return jsonResponse;
  }

  Future<List<PostModel>> fetchAllPosts() async {
    const url = '$baseUrl/posts/';
    final response = await http.get(Uri.parse(url));
    final postsList = json.decode(response.body) as List;
    final jsonResponse =
        postsList.map((e) => PostModel.fromJson(e as Map<String, dynamic>)).toList();

    return jsonResponse;
  }

  Future<List<AlbumModel>> fetchAllAlbums() async {
    const url = '$baseUrl/albums';
    final response = await http.get(Uri.parse(url));
    final albumList = json.decode(response.body) as List;
    final jsonResponse =
        albumList.map((e) => AlbumModel.fromJson(e as Map<String, dynamic>)).toList();
    return jsonResponse;
  }

  Future<List<PhotoModel>> fetchAllPhotos() async {
    const url = '$baseUrl/photos/';
    final response = await http.get(Uri.parse(url));
    final photoList = json.decode(response.body) as List;
    final jsonResponse =
        photoList.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>)).toList();

    return jsonResponse;
  }

  Future<List<CommentModel>> fetchAllComments() async {
    const url = '$baseUrl/comments/';
    final response = await http.get(Uri.parse(url));
    final commentsList = json.decode(response.body) as List;
    final jsonResponse =
        commentsList.map((e) => CommentModel.fromJson(e as Map<String, dynamic>)).toList();

    return jsonResponse;
  }

  Future<List<PostModel>> fetchPostsByUserId(int userId) async {
    final url = '$baseUrl/user/$userId/posts';
    final response = await http.get(Uri.parse(url));
    final postsByUserIdList = json.decode(response.body) as List;
    final jsonResponse =
        postsByUserIdList.map((e) => PostModel.fromJson(e as Map<String, dynamic>)).toList();

    return jsonResponse;
  }

  Future<List<AlbumModel>> fetchAlbumsByUserId(int userId) async {
    final url = '$baseUrl/user/$userId/albums';
    final response = await http.get(Uri.parse(url));
    final albumsByUserIdList = json.decode(response.body) as List;
    final jsonResponse =
        albumsByUserIdList.map((e) => AlbumModel.fromJson(e as Map<String, dynamic>)).toList();

    return jsonResponse;
  }

  Future<List<AlbumModelWithPhotos>> fetchAlbumsByUserIdWithPhotos(
    int userId,
  ) async {
    final url = '$baseUrl/user/$userId/albums?_embed=photos';
    final response = await http.get(Uri.parse(url));
    final albumsWithPhotosByUserIdList = json.decode(response.body) as List;
    final jsonResponse = albumsWithPhotosByUserIdList
        .map((e) => AlbumModelWithPhotos.fromJson(e as Map<String, dynamic>))
        .toList();

    return jsonResponse;
  }

  Future<List<PhotoModel>> fetchPhotosByAlbumId(int albumId) async {
    final url = '$baseUrl/albums/$albumId/photos/';
    final response = await http.get(Uri.parse(url));
    final photosByAlbumsIdList = json.decode(response.body) as List;
    final jsonResponse =
        photosByAlbumsIdList.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>)).toList();

    return jsonResponse;
  }

  Future<List<CommentModel>> fetchCommentsByPostId(int postId) async {
    final url = '$baseUrl/posts/$postId/comments/';
    final response = await http.get(Uri.parse(url));
    final commentsByPostIdList = json.decode(response.body) as List;
    final jsonResponse =
        commentsByPostIdList.map((e) => CommentModel.fromJson(e as Map<String, dynamic>)).toList();

    return jsonResponse;
  }

  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    const url = '$baseUrl/comments/';
    await http.post(
      Uri.parse(url),
      body: {
        'name': name,
        'email': email,
        'body': body,
      },
    );
  }
}
