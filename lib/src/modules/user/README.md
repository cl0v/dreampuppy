## Módulo de usuário.

Será concentrado nesse móduto, todas as atividades relacionadas ao usuário.

Para interações com o usuário fora do módulo, será usado um UserProvider global. O qual irá fornecer o status de login (Não o UID, apenas um isLoggedIn: bool).

Cadastro de cartão também será feito pelo módulo de usuário. Pois o que interessa no módulo de pagamento é apenas o token gerado pelo cadastro de usuário, o qual ficará vinculado à conta, se assim desejado (Caso contrario, não vincular o cartão ao UserFirestoreDoc).


### Todos:
[ ] UserProvider mantém os dados de endereço e cartão cadastrados, simplificando a página em que a pessoa revisa os dados de entrega e pagamento e confirma a compra. (Menos telas e menos botões é uma parte essencial de um App.)
[ ] 


### Arquitetura do módulo.

/user
--/domain
----/auth (preciso do UID e email)
------/usecases
--------/signIn (login)
--------/signUp (register)
--------/signOut (leave) ()
#/ O profile é o responsável por garantir um perfil para o usuário.
#/ Isso significa que deve ter um criador de profile.
#/ Que é quem alimenta as informações do user, criando assim um perfil.
----/profile (User details and edit some non important fields, like birthDate or last Name)
------/usecases
--------/create
--------/delete (Dedicated page)
----/cards
------/usecases
--------/create
--------/list
--------/delete (Could be a widget that is displayed on the list, onDeleteBtnTap)
----/address (Location where the user will receive the Pet)
------/usecases
--------/create
--------/edit (Represented by a widget in a listtile format)
--------/delete
----/requirements (Guide the user through full minimum registration) [Creation of card/address/user sensitive info]
------/usecases
--------/get_user_registration_status (Change name, required to get the current index of requirements)
----/my_pets (purchase history)
