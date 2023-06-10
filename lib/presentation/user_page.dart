import 'package:eds_test/data/models/hive_models/hive_user_model.dart';
import 'package:eds_test/injections/dependency_injections.dart';
import 'package:eds_test/presentation/shared_widgets/album_card.dart';
import 'package:eds_test/presentation/shared_widgets/loader.dart';
import 'package:eds_test/presentation/shared_widgets/post_card.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:eds_test/state_managment/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  final UserModel userModel;

  const UserPage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserPageCubit userPageCubit;

  @override
  void initState() {
    super.initState();
    userPageCubit = getItInstance<UserPageCubit>();
    userPageCubit.loadUsers(userId: widget.userModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userPageCubit,
      child: BlocListener<UserPageCubit, UserPageState>(
        listener: (context, state) {
          if (state.isLoading == false) {
            setState(() {});
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: Text(widget.userModel.username),
            centerTitle: true,
            titleTextStyle: AppTextStyles.title,
            backgroundColor: AppColors.gray,
          ),
          body: userPageCubit.state.isLoading
              ? const Loader()
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${widget.userModel.name}',
                        style: AppTextStyles.bodyTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Contact Information',
                        style: AppTextStyles.bodyTextStyle
                            .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Email: ${widget.userModel.email}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Phone: ${widget.userModel.phone}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Website: ${widget.userModel.website}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Working Company',
                        style: AppTextStyles.bodyTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Name: ${widget.userModel.company.name}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'BS: ${widget.userModel.company.bs}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Catch phase: '${widget.userModel.company.catchPhrase}'",
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Address',
                        style: AppTextStyles.bodyTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'City: ${widget.userModel.address.city}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Street: ${widget.userModel.address.street}',
                        style: AppTextStyles.bodyTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'User Posts',
                              style: AppTextStyles.bodyTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              userPageCubit.navigateToAllPostsPage(
                                user: widget.userModel,
                                posts: userPageCubit.state.posts,
                                context: context,
                              );
                            },
                            icon: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.arrow_right_alt_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 16,
                        ),
                        itemBuilder: (context, index) {
                          final post = userPageCubit.state.posts[index];
                          return GestureDetector(
                            onTap: () {
                              userPageCubit.navigateToPostDetailPage(
                                post: post,
                                context: context,
                              );
                            },
                            child: PostCard(
                              post: post,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'User Albums',
                              style: AppTextStyles.bodyTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              userPageCubit.navigateToAlbumsPage(
                                context: context,
                                albums: userPageCubit.state.albumWithPhotos,
                                user: widget.userModel,
                              );
                            },
                            icon: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.arrow_right_alt_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 16,
                        ),
                        itemBuilder: (context, index) {
                          final album = userPageCubit.state.albumWithPhotos[index];
                          return GestureDetector(
                            onTap: () {
                              userPageCubit.navigateToAlbumDetailPage(
                                album: album,
                                context: context,
                              );
                            },
                            child: AlbumCard(
                              album: album,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
