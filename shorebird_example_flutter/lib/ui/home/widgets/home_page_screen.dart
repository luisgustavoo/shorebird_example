import 'package:flutter/material.dart';
import 'package:shorebird_example_flutter/config/dependencies.dart';
import 'package:shorebird_example_flutter/ui/auth/sign_out/view_models/sign_out_view_model.dart';
import 'package:shorebird_example_flutter/ui/auth/sign_out/widgets/sign_out_button.dart';
import 'package:shorebird_example_flutter/ui/home/view_models/home_page_view_model.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({
    required this.homePageViewModel,
    super.key,
  });

  final HomePageViewModel homePageViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          SignOutButton(
            signOutViewModel: getIt<SignOutViewModel>(),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: homePageViewModel.getUser,
        builder: (context, child) {
          if (homePageViewModel.getUser.running) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (homePageViewModel.getUser.error) {
            return const Center(
              child: Text('Erro ao buscar dados'),
            );
          }
          return child!;
        },
        child: ListenableBuilder(
          listenable: homePageViewModel,
          builder: (context, child) {
            final user = homePageViewModel.user;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Nome: ${user?.userInfo?.userName ?? ''}'),
                        const SizedBox(
                          height: 16,
                        ),
                        Text('Email: ${user?.userInfo?.email ?? ''}'),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Cor favorita: ${user!.favoriteColor ?? 'Não informado'}',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
