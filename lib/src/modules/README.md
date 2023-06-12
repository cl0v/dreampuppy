SHA do ultimo commit antes da alteração: 0dbd16b4eb042418cce7f312139137f56f25cc4f

Motivos da mudança:
Atualmente, quando tento acessar a gallery, é impossível achar onde está o module ao qual ela pertence, dificultando o desenvolvimento.

Isso resulta na necessidade de limpar o código e replanejar a arquitetura de pastas e arquivos. Podendo assim dar mais clareza, agilidade e bases sólidas para o projeto.

### Todos
1: Analyse the case where the widget is required outside the module. (Modular RouteOutlet)

### Instructions
**/presenter/view/$1
$1 -> Can be (page/widget/?) page represents a scaffold, widget represents something that could be used inside the module freely. (TODO:1)
All modules contain the same infra, domain, (...) files that i'm representing in the first module, so please, use them in all modules to 

### New file structure
/breed
----/List (Hoje é a breed_list)
----/About (Sobre a raça. Design parcialmente pronto nos Arquivos)
----/Survey (breed_priority_survey)
----/etc
--/infra
--/domain
--/external
!Geralmente ou tem a /features ou /presenter (Pode ter ambos em casos especificos)!
--module.dart

/pet
--/features
----/Gallery 
----/details/ (pet_details.dart)
----/adults/ (Alterar o nome, preciso representar os pais da ninhada)
----/ninhadas/ (Alterar o nome, preciso representar a ninhada)

/user
--/features
----/auth (preciso do UID e email)
------/features
--------/signIn (login)
--------/signUp (register)
--------/signOut (leave) (Could be a widget)
------/commons [infra/external/domain]
/// O profile é o responsável por garantir um perfil para o usuário.
/// Isso significa que deve ter um criador de profile.
/// Que é quem alimenta as informações do user, criando assim um perfil.
----/profile (User details and edit some non important fields, like birthDate or last Name)
------/features
--------/create
--------/delete (Dedicated page)
----/cards
------/features
--------/create
--------/list
--------/delete (Could be a widget that is displayed on the list,onDeleteBtnTap)
----/address (Location where the user will receive the Pet)
------/features
--------/create
--------/edit (Can be a widget in a listtile format)
--------/delete
----/requirements (Guide the user through full minimum registration) [Creation of card/address/user sensitive info]

/payment
--/features
----/cart
----/
----/cart

/help
--/features
----/Tutorials
----/FAQ
----/Contact
----/