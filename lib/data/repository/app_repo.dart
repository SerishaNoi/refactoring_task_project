import 'package:eds_test/data/models/hive_models/hive_album_model.dart';
import 'package:eds_test/data/models/hive_models/hive_album_with_photo_model.dart';
import 'package:eds_test/data/models/hive_models/hive_comment_model.dart';
import 'package:eds_test/data/models/hive_models/hive_photo_model.dart';
import 'package:eds_test/data/models/hive_models/hive_post_model.dart';
import 'package:eds_test/data/models/hive_models/hive_user_model.dart';
import 'package:eds_test/data/services/app_data_source.dart';
import 'package:eds_test/data/services/local_storage_halper/hive_keys.dart';
import 'package:eds_test/data/services/local_storage_halper/local_starage_halper.dart';
import 'package:eds_test/data/services/network_info.dart';

abstract class AppRepository {
  Future<List<UserModel>> fetchUsers();
  Future<List<PostModel>> fetchAllPosts();
  Future<List<AlbumModel>> fetchAllAlbums();
  Future<List<PhotoModel>> fetchAllPhotos();
  Future<List<CommentModel>> fetchAllComments();
  Future<List<PostModel>> fetchPostsByUserId(int userId);
  Future<List<AlbumModel>> fetchAlbumsByUserId(int userId);
  Future<List<AlbumModelWithPhotos>> fetchAlbumsByUserIdWithPhotos(int userId);
  Future<List<PhotoModel>> fetchPhotosByAlbumId(int albumId);
  Future<List<CommentModel>> fetchCommentsByPostId(int postId);
  Future<void> sendComment({required String name, required String email, required String body});
}

class AppRepositoryImpl extends AppRepository {
  final AppDataSource appDataSource; // реквесты
  final NetworkInfo networkInfo; // проверка статуса интернет соединения
  final LocalStorageHalper localStorageHalper; // работа с локальным хранилищем

  AppRepositoryImpl({
    required this.appDataSource,
    required this.networkInfo,
    required this.localStorageHalper,
  });

  @override
  Future<List<UserModel>> fetchUsers() async {
    var usersList = <UserModel>[];
    var usersFromLocalStorage = <UserModel>[];
    final bool networkConnectivity = await networkInfo.checkConnectivity();

    if (networkConnectivity == true) {
      final users = await appDataSource.fetchAllUsers();

      usersList = users;

      await localStorageHalper.storeData(HiveKeys.usersBox, usersList);
    } else if (networkConnectivity == false) {
      final usersFromLocalStorageData = await localStorageHalper.getData(HiveKeys.usersBox);

      for (final item in usersFromLocalStorageData) {
        usersFromLocalStorage.add(item);
      }
    }

    return networkConnectivity ? usersList : usersFromLocalStorage;
  }

  @override
  Future<List<PostModel>> fetchAllPosts() async {
    var postsList = <PostModel>[];
    var postsListFromLocalStorage = <PostModel>[];
    final bool networkConnectivity = await networkInfo.checkConnectivity();

    if (postsListFromLocalStorage == true) {
      final posts = await appDataSource.fetchAllPosts();

      postsList = posts;

      await localStorageHalper.storeData(HiveKeys.postsBox, posts);
    } else if (networkConnectivity == false) {
      final postsListFromLocalStorageData = await localStorageHalper.getData(HiveKeys.postsBox);

      for (final item in postsListFromLocalStorageData) {
        postsListFromLocalStorage.add(item);
      }
    }

    return networkConnectivity ? postsList : postsListFromLocalStorage;
  }

  @override
  Future<List<AlbumModel>> fetchAllAlbums() async {
    var albumsList = <AlbumModel>[];
    var albumsListFromLocalStorage = <AlbumModel>[];
    final bool networkConnectivity = await networkInfo.checkConnectivity();

    if (networkConnectivity == true) {
      final albums = await appDataSource.fetchAllAlbums();

      albumsList = albums;

      await localStorageHalper.storeData(HiveKeys.albumsBox, albumsList);
    } else if (networkConnectivity == false) {
      final albumsListFromLocalStorageData = await localStorageHalper.getData(HiveKeys.albumsBox);

      for (final item in albumsListFromLocalStorageData) {
        albumsListFromLocalStorage.add(item);
      }
    }

    return networkConnectivity ? albumsList : albumsListFromLocalStorage;
  }

  @override
  Future<List<PhotoModel>> fetchAllPhotos() async {
    var photoList = <PhotoModel>[];
    var photoFromLocalStorage = <PhotoModel>[];
    final bool networkConnectivity = await networkInfo.checkConnectivity();

    if (networkConnectivity == true) {
      final photos = await appDataSource.fetchAllPhotos();

      photoList = photos;

      await localStorageHalper.storeData(HiveKeys.photosBox, photoList);
    } else if (networkConnectivity == false) {
      final photoListFromLocalStorageData = await localStorageHalper.getData(HiveKeys.photosBox);

      for (final item in photoListFromLocalStorageData) {
        photoFromLocalStorage.add(item);
      }
    }

    return networkConnectivity ? photoList : photoFromLocalStorage;
  }

  @override
  Future<List<CommentModel>> fetchAllComments() async {
    var commentsList = <CommentModel>[];
    var commentsListFromLocalStorage = <CommentModel>[];
    final bool networkConnectivity = await networkInfo.checkConnectivity();

    if (networkConnectivity == true) {
      final comments = await appDataSource.fetchAllComments();

      commentsList = comments;

      await localStorageHalper.storeData(HiveKeys.commentsBox, commentsList);
    } else if (networkConnectivity == false) {
      final commentsListFromLocalStorageData =
          await localStorageHalper.getData(HiveKeys.commentsBox);

      for (final item in commentsListFromLocalStorageData) {
        commentsListFromLocalStorage.add(item);
      }
    }

    return await networkConnectivity ? commentsList : commentsListFromLocalStorage;
  }

  @override
  Future<List<PostModel>> fetchPostsByUserId(int userId) async {
    var postsByIdList = <PostModel>[];
    final bool networkConnectivity = await networkInfo.checkConnectivity();

    if (networkConnectivity == true) {
      final postsById = await appDataSource.fetchPostsByUserId(userId);

      postsByIdList = postsById;
    }

    return postsByIdList;
  }

  @override
  Future<List<AlbumModel>> fetchAlbumsByUserId(int userId) async {
    var albumByIdList = <AlbumModel>[];

    if (networkInfo.checkConnectivity() == true) {
      final albumById = await appDataSource.fetchAlbumsByUserId(userId);

      albumByIdList = albumById;

      await localStorageHalper.storeData(HiveKeys.postsBox, albumByIdList);
    }

    return albumByIdList;
  }

  @override
  Future<List<AlbumModelWithPhotos>> fetchAlbumsByUserIdWithPhotos(int userId) async {
    var albumWithPhotosByIdList = <AlbumModelWithPhotos>[];

    if (await networkInfo.checkConnectivity()) {
      final albumWithPhotosById = await appDataSource.fetchAlbumsByUserIdWithPhotos(userId);

      albumWithPhotosByIdList = albumWithPhotosById;
    }

    return albumWithPhotosByIdList;
  }

  @override
  Future<List<PhotoModel>> fetchPhotosByAlbumId(int albumId) async {
    var photosByAlbumIdList = <PhotoModel>[];

    if (await networkInfo.checkConnectivity()) {
      final photosByAlbumId = await appDataSource.fetchPhotosByAlbumId(albumId);

      photosByAlbumIdList = photosByAlbumId;
    }

    return photosByAlbumIdList;
  }

  @override
  Future<List<CommentModel>> fetchCommentsByPostId(int postId) async {
    var commentsByPostIdList = <CommentModel>[];

    if (await networkInfo.checkConnectivity()) {
      final commentsByPostId = await appDataSource.fetchCommentsByPostId(postId);

      commentsByPostIdList = commentsByPostId;
    }

    return commentsByPostIdList;
  }

  @override
  Future<void> sendComment({
    required String name,
    required String email,
    required String body,
  }) async {
    await appDataSource.sendComment(name: name, email: email, body: body);
  }
}
