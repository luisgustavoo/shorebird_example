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
                        Text.rich(
                          TextSpan(
                            text: 'Nome: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: user?.userInfo?.userName ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Email: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: user?.userInfo?.email ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Cor favorita: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: user!.favoriteColor,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
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
