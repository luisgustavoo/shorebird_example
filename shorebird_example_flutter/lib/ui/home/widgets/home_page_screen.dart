import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shorebird_example_flutter/data/services/api/serverpod_client.dart';
import 'package:shorebird_example_flutter/routers/routes.dart';
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
          IconButton(
            onPressed: () async {
              final go = context.go;
              final disconnected = await sessionManager.signOutDevice();
              if (disconnected) {
                go(Routes.signin);
              }
            },
            icon: const Icon(Icons.logout),
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
