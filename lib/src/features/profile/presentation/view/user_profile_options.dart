//TODO: Adicionar o FAQ
//TODO: Adicionar alguma forma do cliente entrar em contato comigo (ZAP da DreamPuppy)
//TODO: Adicionar funcionalidades que permite a pessoa conhecer o app, como página de novidade
//TODO: Adicionar notificações
//TODO: Implementar funcionalidade de documentação pendente (Comprovantes necessários)[Funcionalidade mais voltada para o app do canil]
//TODO: Verificar se a pessoa ta logada (Para depois construir as funcionalidades abaixo)
//TODO: Caso não esteja logada, exibir botão de cadastrar.
//TODO: Adicionar pagina de pedidos: com acompanhamento e historico de compras
//TODO: Adicionar editar perfil
//TODO: Adicionar lista de endereços
//TODO: Adicionar preferencias de pagamento
//TODO: Adicionar botão para ver filhotes favoritados

import 'package:dreampuppy/src/_domain/singletons/user.dart';
import 'package:dreampuppy/src/features/profile/domain/usecases/needhelp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserProfileOptionsView extends StatefulWidget {
  const UserProfileOptionsView({super.key});

  @override
  State<UserProfileOptionsView> createState() => _UserProfileOptionsViewState();
}

class _UserProfileOptionsViewState extends State<UserProfileOptionsView> {
  final userSingleton = Modular.get<UserSingleton>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 36.0),
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.black,
                  child: Icon(
                    //TODO: Caso tenha user e tenha foto de perfil, usa-la
                    userSingleton.user == null ? Icons.lock : Icons.person,
                    color: Colors.white,
                    size: 64,
                  ),
                ),
              ),
               userSingleton.user == null
                  ? ListTile(
                      leading: const Icon(Icons.login),
                      title: const Text("Entrar"),
                      subtitle: const Text("Bem vindo de volta!"),
                      onTap: () => Modular.to.pushNamed('/login'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    )
                  : Container(),
               userSingleton.user == null
                  ? ListTile(
                    //TODO: Adicionar um fundo como se fosse a entrada de um parque de diversões
                      leading: const Icon(Icons.person_add),
                      title: const Text("Cadastrar"),
                      subtitle: const Text("Vem sonhar com a gente..."),
                      onTap: () => Modular.to.pushNamed('/login/register'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    )
                  : Container(),
              userSingleton.user != null
                  ? const Visibility(
                    visible: false,
                    child: ListTile(
                        leading: Icon(Icons.person),
                        subtitle: Text("Altere email, senha, etc.."),
                        title: Text("Editar perfil"),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                  )
                  : Container(),
                  //TODO: Liberar funcionalidade de favoritar
             Visibility(
              visible: false,
              child:  userSingleton.user != null
                  ? const  Visibility(
                    visible: false,
                    child: ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text("Favoritos"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ))
                  : Container(),),
              userSingleton.user != null
                  ? const Visibility(
                    visible: false,
                    child: ListTile(
                      leading: Icon(Icons.document_scanner),
                      title: Text("Documentos pendentes"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ))
                  : Container(),
                  //TODO: (Importante) Implementar histórico de compras
              userSingleton.user != null
                  ? const Visibility(
                    visible: false,
                    child: ListTile(
                      leading: Icon(Icons.history),
                      title: Text("Histórico de compras"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ))
                  : Container(),
              userSingleton.user != null
                  ? const  Visibility(
                    visible: false,
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text("Meus Cartões"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ))
                  : Container(),
              userSingleton.user != null
                  ? const  Visibility(
                    visible: false,
                    child: ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text("Endereço cadastrado"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ))
                  : Container(),
             
              const Visibility(
                    visible: false,
                    child:  ListTile(
                leading: Icon(Icons.notifications),
                title: Text("Notificações"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),),
              const Visibility(
                    visible: false,
                    child:  ListTile(
                leading: Icon(Icons.newspaper),
                title: Text("Novidades"),
                // subtitle: Text("O que há de novo pelo app"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),),
              
              ListTile(
                onTap: () => Modular.get<NeedHelpUseCase>().call('Preciso de ajuda!'),
                leading: const Icon(Icons.auto_stories),
                //TODO: A wiki inclui o faq, como usar o app, tutoriais, etc v
                
                title: const Text("Wiki || Preciso de Ajuda"),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),

              userSingleton.user != null
                  ? const  Visibility(
                    visible: false,
                    child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Sair"),
                      ),
                  )
                  : Container(),

                //TODO: O botão de Sobre Informa os dados do aplicativo (Versão, etc...)
                // ! [ Tambem irá informar atualizações disponíveis para o user]
               const ListTile(
                        leading: Icon(Icons.info),
                        title: Text("Sobre"),
                  ),
            ]
                .map((e) => e.runtimeType == ListTile
                    ? Card(
                        child: e,
                      )
                    : e)
                .toList(),
          ),
        ),
      ),
    );
  }
}
