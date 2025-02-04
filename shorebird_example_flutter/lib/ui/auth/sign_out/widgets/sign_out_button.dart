import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shorebird_example_flutter/routers/routes.dart';
import 'package:shorebird_example_flutter/ui/auth/sign_out/view_models/sign_out_view_model.dart';

class SignOutButton extends StatefulWidget {
  const SignOutButton({
    required this.signOutViewModel,
    super.key,
  });

  final SignOutViewModel signOutViewModel;

  @override
  State<SignOutButton> createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {
  @override
  void initState() {
    super.initState();
    widget.signOutViewModel.addListener(_onResult);
  }

  @override
  void didUpdateWidget(covariant SignOutButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.signOutViewModel.removeListener(_onResult);
    widget.signOutViewModel.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.signOutViewModel.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.signOutViewModel.signOut.completed) {
      context.go(Routes.signin);
    }

    if (widget.signOutViewModel.signOut.error) {
      final error = widget.signOutViewModel.error;

      widget.signOutViewModel.signOut.clearResult();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error?.message ?? 'Erro ao fazer logout'),
          action: SnackBarAction(
            label: 'Tente novamente',
            onPressed: widget.signOutViewModel.signOut.execute,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await widget.signOutViewModel.signOut.execute();
      },
      icon: const Icon(Icons.logout),
    );
  }
}
