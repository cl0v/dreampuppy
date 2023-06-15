import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../widgets/btn_loading.dart';
import '../../../../../widgets/custom_text_field.dart';

import '../../../domain/auth/errors/signup_handler.dart';
import '../../../domain/auth/usecases/signup.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    this.onRedirect,
  });

  final VoidCallback? onRedirect;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(
      // text: kDebugMode ? 'marcelofv12@hotmail.com' : null,
      );
  final passwordController = TextEditingController(
      // text: kDebugMode ? '123123123' : null,
      );

  late final SignupUseCase signupUseCase = Modular.get<SignupUseCase>();

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  signUp() async {
    //TODO: Implementar sistema de validaçao
    if (_isLoading.value) return;
    if (!_formKey.currentState!.validate()) return;
    _isLoading.value = true;
    try {
      await signupUseCase(emailController.text.trim(), passwordController.text);

      var onDone = widget.onRedirect ?? () => Modular.to.pop();
      onDone.call();
    } on SignUpErrorHandler catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade400,
          content: Center(
            child: Text(e.message),
          ),
        ),
      );
    } finally {
      _isLoading.value = false;
    }
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
                  // logo
                  SizedBox(
                    height: 150,
                    child: Image.asset(
                      "assets/images/icons/logo512.png",
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  CustomTextFieldWidget(
                    controller: emailController,
                    hintText: 'Seu melhor E-mail',
                    label: 'E-mail',
                    validator: (value) {
                      if (value == null) {
                        print("Valor é nulo, investigar essa situação");
                      }
                      if (value!.isEmpty) {
                        return 'Digite um email válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFieldWidget(
                    controller: passwordController,
                    isPasswordField: true,
                    label: "Senha",
                    hintText: 'Senha de acesso',
                    validator: (value) {
                      if (value == null) {
                        print("Valor é nulo, investigar essa situação");
                      }
                      if (value!.isEmpty) {
                        return 'Digite uma senha válida';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 35),

                  // TODO: Adicionar indicador de carregamento.
                  ValueListenableBuilder(
                    valueListenable: _isLoading,
                    builder: (_, isloading, __) {
                      return BtnLoading(
                        label: 'Cadastrar',
                        onPressed: signUp,
                        isLoading: isloading,
                      );
                    },
                  ),

                  const SizedBox(height: 30),
                  // or continue with
                  Visibility(
                    visible: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Ou continue com',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 300,
                  //   child: Flexible(
                  //     flex: 2,
                  //     child: SingleChildScrollView(
                  //       child: SignOutButton(variant: ButtonVariant.text),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 50),

                  // // google + apple sign in buttons
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: const [
                  //      TODO: google button
                  //     // SquareTile(imagePath: 'lib/images/google.png'),

                  //     SizedBox(width: 25),

                  //     TODO: apple button
                  //     // SquareTile(imagePath: 'lib/images/apple.png')
                  //   ],
                  // ),

                  // const SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Já tenho conta',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        onPressed: () =>
                            Modular.to.pushReplacementNamed('/user/login'),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
