import 'package:eds_test/injections/dependency_injections.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:eds_test/presentation/user_page.dart';
import 'package:eds_test/state_managment/main_page_cubit/main_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared_widgets/loader.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainPageCubit mainPageCubit;

  @override
  void initState() {
    super.initState();
    mainPageCubit = getItInstance<MainPageCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainPageCubit,
      child: BlocListener<MainPageCubit, MainPageState>(
        listener: (context, state) {
          if (state.isLoading == false) {
            setState(() {});
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            title: const Text('All Users'),
            centerTitle: true,
            titleTextStyle: AppTextStyles.title,
            backgroundColor: AppColors.gray,
          ),
          body: mainPageCubit.state.isLoading
              ? const Loader()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: mainPageCubit.state.users.length,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (context, index) {
                    final user = mainPageCubit.state.users[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(
                              userModel: user,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: AppColors.gray,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 32,
                              color: AppColors.white,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.username,
                                    style: AppTextStyles.title,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    user.name,
                                    style: AppTextStyles.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
