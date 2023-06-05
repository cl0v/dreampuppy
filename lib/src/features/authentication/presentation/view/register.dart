import 'package:dreampuppy/src/features/authentication/presentation/domain/usecases/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';
import '../domain/errors/signup_handler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();
  // final cpfController = TextEditingController();
  // final phoneController = TextEditingController();
  // TODO: Ver necessidade de campo telefone
  // TODO: Perdir Endereço em outra tela

  late SignupUseCase signupUseCase = Modular.get<SignupUseCase>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  signUp() async {
    //TODO: Implementar sistema de validaçao
    if (!_formKey.currentState!.validate()) return;
      try {
        await signupUseCase(
          fullNameController.text,
          emailController.text,
          passwordController.text,
        );
        Modular.to.pop();
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
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  Text(
                    'Crie sua conta',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  CustomAuthTextField(
                    controller: fullNameController,
                    hintText: 'Seu nome completo',
                    validator: (value) {
                      if(value == null){
                        print("Valor é nulo, investigar essa situação");
                      }
                      if (value!.isEmpty) {
                        return 'Digite um nome válido';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 10),

                  // username textfield
                  CustomAuthTextField(
                    controller: emailController,
                    hintText: 'Seu melhor E-mail',
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

                  // TODO: Adicionar sistema de verificação de senha (icone de olho + Quando exibido, afastar um pouco os caracteres)
                  CustomAuthTextField(
                    controller: passwordController,
                    obscureText: true,
                    hintText: 'Senha de acesso',
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

                  // password textfield

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //TODO: Implementar esqueci minha senha
                        Text(
                          'Esqueceu a senha?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // TODO: Adicionar indicador de carregamento.
                  CustomAuthButton(
                    label: 'Cadastrar',
                    onTap: signUp,
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Já tenho conta',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () =>
                            Modular.to.pushReplacementNamed('/login'),
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
