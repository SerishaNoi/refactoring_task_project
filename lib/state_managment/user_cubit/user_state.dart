part of 'user_cubit.dart';

class UserPageState {
  final List<PostModel> posts;
  final List<AlbumModelWithPhotos> albumWithPhotos;
  final List<CommentModel> comments;
  final CubitState state;
  final String erroreMessage;
  final bool isLoading;

  UserPageState({
    this.posts = const [],
    this.albumWithPhotos = const [],
    this.comments = const [],
    this.state = CubitState.initial,
    this.erroreMessage = '',
    this.isLoading = true,
  });

  List<Object> get props => [
        posts,
        albumWithPhotos,
        comments,
        state,
        erroreMessage,
        isLoading,
      ];

  UserPageState copyWith({
    final List<PostModel>? posts,
    final List<AlbumModelWithPhotos>? albumWithPhotos,
    final List<CommentModel>? comments,
    final CubitState? state,
    final String? erroreMessage,
    final bool? isLoading,
  }) {
    return UserPageState(
      posts: posts ?? this.posts,
      albumWithPhotos: albumWithPhotos ?? this.albumWithPhotos,
      comments: comments ?? this.comments,
      state: state ?? this.state,
      erroreMessage: erroreMessage ?? this.erroreMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
