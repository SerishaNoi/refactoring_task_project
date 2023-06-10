import 'package:eds_test/data/models/hive_models/hive_post_model.dart';
import 'package:eds_test/data/repository/app_repo.dart';
import 'package:eds_test/injections/dependency_injections.dart';
import 'package:eds_test/presentation/shared_widgets/comment_card.dart';
import 'package:eds_test/presentation/shared_widgets/custom_text_field.dart';
import 'package:eds_test/presentation/shared_widgets/loader.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:eds_test/state_managment/user_cubit/user_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailPage extends StatefulWidget {
  final PostModel post;

  const PostDetailPage({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late UserPageCubit userPageCubit;
  late AppRepository repository;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userPageCubit = getItInstance<UserPageCubit>();
    userPageCubit.loadComments(postId: widget.post.id);
  }

  void _clearText() {
    nameController.clear();
    emailController.clear();
    commentController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
    super.dispose();
  }

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          scrollable: true,
          title: const Text('Add new comment'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Name',
                    validatorMessage: 'Name cannot be empty',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: emailController,
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'E-mail',
                    validatorMessage: 'Email cannot be empty',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: commentController,
                    prefixIcon: const Icon(Icons.message),
                    hintText: 'Comment',
                    validatorMessage: 'Comment cannot be empty',
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                repository.sendComment(
                  name: nameController.text,
                  email: emailController.text,
                  body: commentController.text,
                );
                Navigator.of(context).pop();
                _clearText();
              },
            )
          ],
        );
      },
    );
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
    
          appBar: AppBar(
            title: Text(widget.post.title),
            centerTitle: true,
            titleTextStyle: AppTextStyles.title,
            backgroundColor: AppColors.gray,
          ),
          body: userPageCubit.state.isLoading
              ? const Loader()
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Text(
                      widget.post.title,
                      style: AppTextStyles.title.copyWith(
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 7),
                    Text(
                      widget.post.body,
                      style: AppTextStyles.bodyTextStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('Comments:'),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final comment = userPageCubit.state.comments[index];
                        return CommentCard(
                          username: comment.name,
                          comment: comment.body,
                          email: comment.email,
                        );
                      },
                      itemCount: userPageCubit.state.comments.length,
                    ),
                  ],
                ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              size: 20,
            ),
            onPressed: () => _displayDialog(context),
          ),
        ),
      ),
    );
  }
}
