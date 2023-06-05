import 'package:dreampuppy/src/features/authentication/presentation/domain/errors/login_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';
import '../domain/usecases/login.dart';

//TODO: Implementar esqueci minha senha

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  late final loginUseCase = Modular.get<LoginUseCase>();

  // sign user in method
  void login() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      await loginUseCase(usernameController.text, passwordController.text);
      Modular.to.pop();
    } on LoginErrorHandler catch (e, s) {
      debugPrintStack(stackTrace: s);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red.shade400,
            content: Center(child: Text(e.message))),
      );
    }
  }

  void _onForgotPassword() {
    print('//TODO: forgot password');
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
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  Text(
                    'Bem vindo de volta, sentimos sua falta!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  CustomAuthTextField(
                    controller: usernameController,
                    hintText: 'E-mail',
                    obscureText: false,
                    validator: (value) {
                      if(value == null){
                        print("Valor é nulo, investigar essa situação");
                      }
                      if (value!.isEmpty) {
                        return 'Digite um email válido';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  CustomAuthTextField(
                    controller: passwordController,
                    hintText: 'Senha',
                    obscureText: true,
                    validator: (value) {
                      if(value == null){
                        print("Valor é nulo, investigar essa situação");
                      }
                      if (value!.isEmpty) {
                        return 'Digite uma senha válida';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //TODO: Implementar esqueci minha senha
                        GestureDetector(
                          onTap: _onForgotPassword,
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  CustomAuthButton(
                    onTap: login,
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

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'É novo por aqui?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () =>
                            Modular.to.pushReplacementNamed('./create'),
                        child: const Text(
                          'Cadastrar agora',
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
