import 'package:dreampuppy/src/features/authentication/domain/usecases/fetch_email.dart';
import 'package:dreampuppy/src/features/authentication/domain/usecases/reset_password.dart';
import 'package:dreampuppy/src/features/authentication/presentation/components/btn_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../components/custom_auth_text_field.dart';

//TODO: Adicionar sistema de validação da requisição, avisando o user de possíveis problemas.
//TODO: Após resetar a senha, o user é automaticamente logado e mantém a sessão ativa.

class ResetPasswordPage extends StatelessWidget {
  final String code;

  ResetPasswordPage({super.key, required this.code});

  late final ResetPasswordUseCase forgotPasswordUseCase = Modular.get<ResetPasswordUseCase>();
  late final FetchEmailUseCase fetchEmailFromPasswordRecoveryUseCase = Modular.get<FetchEmailUseCase>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  resetPassword() async {
    if (!_formKey.currentState!.validate()) return;
    if(passwordController.text != confirmPasswordController.text) return;
    try {
    await forgotPasswordUseCase(code, passwordController.text);
      
      Modular.to.pop();
    } catch (e){
      rethrow;
    }
    /*
    on SignUpErrorHandler catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade400,
          content: Center(
            child: Text(e.message),
          ),
        ),
      );
    } */

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  FutureBuilder<String>(
                    future: fetchEmailFromPasswordRecoveryUseCase(code),
                    builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text('Trocar senha do email: ${snapshot.data}');
                    }
                    return Container();
                  }),
                  CustomAuthTextField(
                    controller: passwordController,
                    hintText: 'Senha',
                    isPasswordField: true,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Digite uma senha válida';
                      }
                      return null;
                    },
                  ),
                  CustomAuthTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirme sua senha',
                    isPasswordField: true,
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Digite uma senha válida';
                      }
                      return null;
                    },
                  ),

                  BtnLoading(
                    onPressed: resetPassword,
                    label: 'Redefinir senha',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
