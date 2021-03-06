import 'package:fethr/repositories/authentication_repository/authentication_repository.dart';
import 'package:fethr/screens/Welcome_screen/components/background.dart';
import 'package:fethr/signup/cubit/signup_cubit.dart';
import 'package:fethr/signup/view/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider<SignUpCubit>(
            create: (_) =>
                SignUpCubit(context.read<AuthenticationRepository>()),
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}
