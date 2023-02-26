import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mileazofltr/logic/cubits/login_cubit/login_cubit.dart';
import 'package:mileazofltr/logic/cubits/login_cubit/login_register_state.dart';
import 'package:mileazofltr/services/authentication.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginScreenForm(),
    );
  }
}

class LoginScreenForm extends StatefulWidget {
  @override
  _LoginScreenFormState createState() => _LoginScreenFormState();
}

class _LoginScreenFormState extends State<LoginScreenForm> {
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

// Future<void> _checkAuthenticationStatus() async {
//     if (await widget.authenticationRepository.isAuthenticated()) {
//       // Redirect the user to the home screen
//       Navigator.of(context).pushReplacementNamed('/home');
//     }
//   }
  @override
  Widget build(BuildContext context) {
    final _loginCubit = context.watch<LoginCubit>();

    return Form(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            GoRouter.of(context).pushNamed("splash");
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(hintText: 'Phone number'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 16),
                if (state is LoginLoading) CircularProgressIndicator(),
                if (state is! LoginLoading)
                  ElevatedButton(
                    onPressed: () {
                      _loginCubit.login(
                        _phoneNumberController.text,
                        _passwordController.text,
                      );
                    },
                    child: Text('Login'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
