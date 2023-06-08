import 'package:dreampuppy/src/features/authentication/domain/usecases/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../components/custom_auth_button.dart';
import '../components/custom_auth_text_field.dart';
import '../../domain/errors/signup_handler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
    this.onCreate,
  });

  final VoidCallback? onCreate;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController(
    text: kDebugMode ? 'Viana' : null,
  );
  final emailController = TextEditingController(
    text: kDebugMode ? 'marcelofv12@hotmail.com' : null,
  );
  final passwordController = TextEditingController(
    text: kDebugMode ? '123123123' : null,
  );

  late SignupUseCase signupUseCase = Modular.get<SignupUseCase>();

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  signUp() async {
    //TODO: Implementar sistema de validaçao
    if (_isLoading.value) return;
    if (!_formKey.currentState!.validate()) return;
    _isLoading.value = true;
    try {
      await signupUseCase(
        fullNameController.text,
        emailController.text.trim(),
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
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
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
                      if (value == null) {
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
                  // TODO: Adicionar sistema de verificação de senha (icone de olho + Quando exibido, afastar um pouco os caracteres)
                  CustomAuthTextField(
                    controller: passwordController,
                    isPasswordField: true,
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
                      return LoadingBlackButton(
                        label: 'Cadastrar',
                        onTap: widget.onCreate ?? signUp,
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
