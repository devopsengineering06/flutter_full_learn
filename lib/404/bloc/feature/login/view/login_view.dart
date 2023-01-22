import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/login_cubit.dart';
import '../cubit/login_cubit_state.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginText = 'Login';
  final GlobalKey<FormState> _formLoginKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      //LoginCubit Bunun altındakilerle konuşur. AppBar ' ı kapsamasaydı bilgiler gelmezdi.
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (ctx, state) {
              return state.isLoading
                  ? CircularProgressIndicator(
                      color: ctx.colorScheme.secondary,
                    )
                  : const SizedBox();
            },
          ),
        ),
        body: Form(
          key: _formLoginKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const PagePadding.all(),
            child: Column(
              children: [
                _LoginEmailPasswordField(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                _LoginButton(
                    formLoginKey: _formLoginKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    loginText: _loginText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required String loginText,
  })  : _formLoginKey = formLoginKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _loginText = loginText,
        super(key: key);

  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final String _loginText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (ctx, state) {
        return ElevatedButton(
          onPressed: () {
            if (_formLoginKey.currentState?.validate() ?? false) {
              ctx.read<LoginCubit>().checkUser(_emailController.text, _passwordController.text);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$_loginText - ${state.model?.email ?? ''}'),
          ),
        );
      },
    );
  }
}

class _LoginEmailPasswordField extends StatelessWidget {
  const _LoginEmailPasswordField({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state,
          child: AnimatedOpacity(
            duration: context.durationLow,
            opacity: state ? 0.3 : 1,
            child: Column(
              children: [
                Padding(
                  padding: const PagePadding.bottom(),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (String? data) => (data?.isValidEmail ?? false) ? null : 'Problem',
                  ),
                ),
                Padding(
                  padding: const PagePadding.bottom(),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (String? data) => (data?.isValidPassword ?? false) ? null : 'Problem',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
  const PagePadding.bottom() : super.only(bottom: 10);
}
