import 'package:bloc/bloc.dart';
import 'package:eds_test/data/models/hive_models/hive_album_with_photo_model.dart';
import 'package:eds_test/data/models/hive_models/hive_comment_model.dart';
import 'package:eds_test/data/models/hive_models/hive_post_model.dart';
import 'package:eds_test/data/models/hive_models/hive_user_model.dart';
import 'package:eds_test/data/repository/app_repo.dart';
import 'package:eds_test/data/services/network_info.dart';
import 'package:eds_test/methods/show_network_errore_message.dart';
import 'package:eds_test/presentation/album_detail_page.dart';
import 'package:eds_test/presentation/all_albums_page.dart';
import 'package:eds_test/presentation/all_posts_page.dart';
import 'package:eds_test/presentation/post_detail_page.dart';
import 'package:eds_test/state_managment/cubit_satates.dart';
import 'package:flutter/material.dart';

part 'user_state.dart';

class UserPageCubit extends Cubit<UserPageState> {
  final AppRepository appRepository;

  UserPageCubit({
    required this.appRepository,
  }) : super(UserPageState());

  loadUsers({required int userId}) async {
    emit(state.copyWith(state: CubitState.loading));

    if (await NetworkInfo().checkConnectivity() == true) {
      final postsData = await appRepository.fetchPostsByUserId(userId);
      final albumsData = await appRepository.fetchAlbumsByUserIdWithPhotos(userId);

      if (postsData.isNotEmpty && albumsData.isNotEmpty) {
        emit(state.copyWith(
            posts: postsData,
            albumWithPhotos: albumsData,
            state: CubitState.loaded,
            isLoading: false));
      }

      if (postsData.isEmpty && albumsData.isNotEmpty) {
        emit(
          state.copyWith(
              erroreMessage: 'Something got wrong', state: CubitState.failure, isLoading: false),
        );
      }
    } else {
      emit(state.copyWith(state: CubitState.failure));
      showNetworkErroreToast();
    }
  }

  loadComments({required int postId}) async {
    emit(state.copyWith(state: CubitState.loading));

    if (NetworkInfo().checkConnectivity() == true) {
      final commentsData = await appRepository.fetchCommentsByPostId(postId);

      if (commentsData.isNotEmpty) {
        emit(state.copyWith(comments: commentsData, state: CubitState.loaded, isLoading: false));
      }

      if (commentsData.isEmpty) {
        emit(
          state.copyWith(
              erroreMessage: 'Something got wrong', state: CubitState.failure, isLoading: false),
        );
      }
    } else {
      emit(state.copyWith(state: CubitState.failure));
      showNetworkErroreToast();
    }
  }

  navigateToAllPostsPage({
    required UserModel user,
    required List<PostModel> posts,
    required BuildContext context,
  }) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => AllPostsPage(
          user: user,
          posts: posts,
        ),
      ),
    );
  }

  navigateToPostDetailPage({
    required PostModel post,
    required BuildContext context,
  }) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailPage(
          post: post,
        ),
      ),
    );
  }

  navigateToAlbumsPage({
    required UserModel user,
    required List<AlbumModelWithPhotos> albums,
    required BuildContext context,
  }) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => AllAlbumsPage(
          user: user,
          albums: albums,
        ),
      ),
    );
  }

  navigateToAlbumDetailPage({
    required AlbumModelWithPhotos album,
    required BuildContext context,
  }) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumDetailPage(
          album: album,
        ),
      ),
    );
  }
}
