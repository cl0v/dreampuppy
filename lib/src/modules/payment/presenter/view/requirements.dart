import 'package:dreampuppy/src/features/authentication/presentation/components/btn_loading.dart';
import 'package:flutter/material.dart';

import '../components/user_sensitive_data_form.dart';

class PaymentUserRequirementsPage extends StatefulWidget {
  const PaymentUserRequirementsPage({super.key});

  @override
  State<PaymentUserRequirementsPage> createState() =>
      _PaymentUserRequirementsPageState();
}

class _PaymentUserRequirementsPageState
    extends State<PaymentUserRequirementsPage> {
  int idx = 0;
  List<Step> steps = [];

  ValueNotifier loadingNotifier = ValueNotifier(false);

  late final GlobalKey<FormState> dataFormKey;
  late final GlobalKey<FormState> addressFormKey;
  late final GlobalKey<FormState> cardFormKey;

  getDataFormKey(GlobalKey<FormState> formKey) {
    dataFormKey = formKey;
  }

  getAddressFormKey(GlobalKey<FormState> formKey) {
    addressFormKey = formKey;
  }

  getCardFormKey(GlobalKey<FormState> formKey) {
    cardFormKey = formKey;
  }

  bool isLoading(loading) {
    if (loading) return true;
    loadingNotifier.value = true;
    return false;
  }

  void releaseButton(bool shouldStepFoward, ControlsDetails details) {
    if (shouldStepFoward) {
      setState(() {
        idx = details.currentStep + 1;
      });
    }
    loadingNotifier.value = false;
  }

  Future<void> onTap(bool loading, ControlsDetails details) async {
    if (isLoading(loading)) return;
    bool shouldStepFoward = false;
    switch (details.currentStep) {
      case 0:
        shouldStepFoward = await updateUserSensitiveData();
        break;
      case 1:
        shouldStepFoward = await updateUserSensitiveData();
        break;
      case 2:
        shouldStepFoward = await updateUserSensitiveData();
        break;
      default:
    }
    // if (details.currentStep == steps.length - 2) {
    //   return Navigator.of(context).pushNamed("/payment");
    // }
    releaseButton(shouldStepFoward, details);
  }

  /// Atualiza os dados de segurança do usuário.
  Future<bool> updateUserSensitiveData() async {
    bool? formValidation = dataFormKey.currentState?.validate();
    bool errorWithFormValidation = !(formValidation ?? true);
    if (errorWithFormValidation) return false;
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> updateUserAddress() async {
    bool? formValidation = addressFormKey.currentState?.validate();
    bool errorWithFormValidation = !(formValidation ?? true);
    if (errorWithFormValidation) return false;
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  void initState() {
    super.initState();
    steps = [
      Step(
        subtitle: const Text("Segurança"),
        // label: Text("Dados"),
        isActive: false,
        title: const Text("Dados"),
        content: Padding(
          padding: const EdgeInsets.only(bottom: 64.0),
          child: UserSensitiveDataFormComponent(
            setFormKey: getDataFormKey,
          ),
        ),
      ),
      const Step(
        title: Text("Entrega"),
        subtitle: Text("Frete"),
        content: Card(
          child: ListTile(
            trailing: Icon(Icons.arrow_forward_ios),
            title: Text("Endereço"),
          ),
        ),
      ),
      const Step(
        subtitle: Text("Conclusão"),
        title: Text("Pagamento"),
        content: Column(
          children: [
            Card(
              child: ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text("Pagamento"),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stepper(
          currentStep: idx,
          type: StepperType.horizontal,
          elevation: 0,
          controlsBuilder: (_, details) => Expanded(
                child: ValueListenableBuilder(
                    valueListenable: loadingNotifier,
                    builder: (_, isLoading, __) {
                      return BtnLoading(
                        margin: EdgeInsets.zero,
                        color: Colors.blue,
                        isLoading: isLoading,
                        // TODO: Implementar a navegação na ultima página
                        onPressed: () => onTap(
                          isLoading,
                          details,
                        ),
                        label: "Próximo",
                      );
                    }),
              ),
          steps: steps
          // SizedBox(
          //   child: Placeholder(
          //     child: Text("Alguma nota"),
          //   ),
          // ),
          // ElevatedButton(
          //   child: Text("Continuar"),
          //   onPressed: () => null,
          // ),
          // ],
          ),
    );
  }
}

class UserAddressDataFormView extends StatefulWidget {
  const UserAddressDataFormView({super.key});

  @override
  State<UserAddressDataFormView> createState() =>
      _UserAddressDataFormViewState();
}

class _UserAddressDataFormViewState extends State<UserAddressDataFormView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
