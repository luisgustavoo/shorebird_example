import 'package:flutter/material.dart';

class UpdatedScreen extends StatelessWidget {
  const UpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 200,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Aplicativo atualizado, favor reiniciar o aplicativo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
