import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dreampuppy/src/modules/user/domain/auth/errors/login_error_handler.dart';
import 'package:dreampuppy/src/modules/user/domain/auth/usecases/forgot_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../widgets/btn_loading.dart';
import '../../../../../widgets/custom_text_field.dart';
import '../../../domain/auth/usecases/login.dart';
import '../../../interface/navigation.dart';
import '../../controller/auth/auth_controller.dart';

//TODO: Implementar esqueci minha senha

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(
      // text: kDebugMode ? 'marcelo.viana@email.com' : null,
      );
  final passwordController = TextEditingController(
      // text: kDebugMode ? 'marcelo.viana@email.com' : null,
      );

  late final loginUseCase = Modular.get<SignInWithEmailAndPasswordUseCase>();
  late final forgotPasswordUseCase = Modular.get<ForgotPasswordUseCase>();
  late final authNavigation = Modular.get<AuthNavigation>();
  late final authController = Modular.get<AuthController>();

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  // sign user in method
  void login() async {
    if (_isLoading.value) return;
    if (!_formKey.currentState!.validate()) return;
    _isLoading.value = true;
    try {
      final uuid = await loginUseCase(
          emailController.text.trim(), passwordController.text);
      authNavigation.onLogin(emailController.text, uuid);
    } on LoginErrorHandler catch (e, s) {
      debugPrintStack(stackTrace: s);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red.shade400,
            content: Center(child: Text(e.message))),
      );
    } finally {
      _isLoading.value = false;
    }
  }

  void onForgotPassword() {
    //TODO: Exibir Dialog falando que um email será enviado para o email preenchido no campo email. Caso apertar enviar email de recuperação,
    if (emailController.text.length < 4) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          toastLength:
              Toast.LENGTH_LONG, // TODO: Aumentar a duração do toast para iOS
          gravity: ToastGravity.CENTER,
          msg:
              "Preencha o campo de email.");
      return;
    }
    AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            showCloseIcon: true,
            btnOkText: 'Enviar email de recuperação',
            btnOkOnPress: () =>
                forgotPasswordUseCase.call(emailController.text.trim()),
            body: Text('Um email será enviado para:\n\n${emailController.text.trim()}\n\nAcesse o link enviado para recuperar sua senha'))
            // desc: //TODO: Fazer o email ficar em negrito e underline (Tentar deixar o mais claro para qual email será enviado)
            //     'Um email será enviado para:\n\n${emailController.text.trim()}\n\nAcesse o link enviado para recuperar sua senha')
        .show();
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

                  // welcome back, you've been missed!
                  Text(
                    'Bem vindo de volta',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username textfield
                  OccludeWrapper(
                    child: CustomTextFieldWidget(
                      key: const Key('email'),
                      controller: emailController,
                      hintText: 'E-mail',
                      label: "E-mail",
                      isPasswordField: false,
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
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  OccludeWrapper(
                    child: CustomTextFieldWidget(
                      key: const Key('password'),
                      controller: passwordController,
                      hintText: 'Senha',
                      label: "Senha",
                      isPasswordField: true,
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
                          key: const Key('btnForgotPassword'),
                          onTap: onForgotPassword,
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
                  BtnLoading(
                    key: const Key('btnLogin'),
                    onPressed: login,
                    label: 'Entrar',
                  ),

                  const SizedBox(height: 30),

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
                      CupertinoButton(
                        key: const Key('btnRegister'),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        onPressed: () async {
                          try {
                            await Modular.to
                                .pushReplacementNamed('/user/login/create');
                          } catch (e) {
                            print(e);
                          }
                        },
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
