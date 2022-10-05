import 'package:flutter/material.dart';
import 'package:my_balance/core/core.dart';
import 'package:my_balance/modules/login/controllers/login_controller.dart';
import 'package:my_balance/shared/components/app_default_button.dart';
import 'package:my_balance/shared/components/app_input_field.dart';
import 'package:my_balance/shared/components/app_loading_icon.dart';
import 'package:my_balance/shared/components/app_logo.dart';
import 'package:validatorless/validatorless.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final sizes = AppSizes(context);

    return Container(
      height: sizes.safeHeight,
      padding: EdgeInsets.symmetric(horizontal: sizes.displayWidth * 0.15),
      child: Form(
        key: loginController.formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              const AppLogo(),
              AppInputField(
                label: "E-mail",
                controller: loginController.emailController,
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validatorless.multiple([
                  Validatorless.required("Digite seu e-mail"),
                  Validatorless.email("Digite um e-mail válido"),
                ]),
              ),
              AppInputField(
                controller: loginController.passwordController,
                label: "Senha",
                textInputType: TextInputType.visiblePassword,
                obscureText: true,
                validator: Validatorless.multiple([
                  Validatorless.required("Digite sua senha"),
                ]),
                onFieldSubmitted: (String value) {
                  loginController.login(context);
                },
              ),
              const SizedBox(height: 40),
              AppDefaultButton(
                onPressed: () {
                  loginController.login(context);
                },
                child: ValueListenableBuilder<PageState>(
                  valueListenable: loginController.pageStateNotifier,
                  builder: (context, state, _) {
                    switch (state) {
                      case PageState.loading:
                        return const AppLoadingIcon(
                          valueColor: AppColors.white,
                          size: 18,
                        );
                      case PageState.notLoading:
                        return const Text("Entrar");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
