SHA do ultimo commit antes da alteração: 0dbd16b4eb042418cce7f312139137f56f25cc4f

Motivos da mudança:
Atualmente, quando tento acessar a gallery, é impossível achar onde está o module ao qual ela pertence, dificultando o desenvolvimento.

Isso resulta na necessidade de limpar o código e replanejar a arquitetura de pastas e arquivos. Podendo assim dar mais clareza, agilidade e bases sólidas para o mantimento do projeto.

### Todos
#1: Analyse the case where the widget is required outside the module. (Modular RouteOutlet)

### Instructions
**/presenter/view/$1
$1 -> Can be (page, widget or ?) page represents a scaffold, widget represents something that could be used inside the module freely. (TODO:#1)
All modules contain the same infra, domain, (...) files that i'm representing in the first module, so please, use them in all modules too

### New file structure
/breed
--/infra
--/external
--/domain
----/List (Hoje é a breed_list)
----/About (Sobre a raça. Design parcialmente pronto nos Arquivos)
----/Survey (breed_priority_survey)
----/Notify (breed_priority_survey)
------/usecases  # e.g NotifyMeService..addWaitList(NotifyMeEntity)
------/entities  # e.g NotifyMeEntity(Breed, Contact/User)
------/errors  # e.g FailedToNotify(cause, message, code) ## Por enquanto apenas "message" já quebra o galho.
--/presenter
---- breeds.dart (Hoje é a breed_list)
---- about.dart  # Versão incompleta pode ser encontrada nos arquivos. about.dart
---- survey.dart  # If is more than 1 page, make it a folder
---- notify.dart  # Notify users when the breed releases. (Add personal contact, and redirect to create account)
--module.dart

/pet
--/domain
----/Gallery
------/usecases  # e.g PetDataSource.fillGallery(PetPreferences)
------/entities  # e.g PetPreferences(SelectedGender, SelectedColor, SelectedVariation, etc...), GalleryEntity(imgUrl, idb => iddatabase)
------/errors  # e.g FailedToFillGallery(cause, message, code) ## Por enquanto apenas "message" já quebra o galho.
----/Details (pet_details.dart)
----/Adults (Alterar o nome, preciso representar os pais da ninhada)
----/Ninhadas (Alterar o nome, preciso representar a ninhada)
--/presenter
---- filters.dart (/:breed) 
---- gallery.dart (/:breed/gallery)
---- details.dart (/p/:id)
---- parent.dart 
---- l.dart (Representa o "lote", alterar nome, por enquanto usar ninhada)

/user
--/domain
----/auth (preciso do UID e email)
------/usecases
--------/signIn (login)
--------/signUp (register)
--------/signOut (leave)  #É necessário que ele seja chamado no profile.
/// O profile é o responsável por garantir um perfil para o usuário.
/// Isso significa que deve ter um criador de profile.
/// Que é quem alimenta as informações do user, criando assim um perfil.
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

/payment
--/domain
----/Cart
----/Payment
----/Done
----/Review

/help
--/domain
----/FAQ
----/Wiki
----/About
----/Contact
----/Tutorials






Detalhes -> Carrinho (Revisão) -> Login/Cadastro ->
$1[CreateProfile / skip] -> $2[CreateAddress / skip] -> SelectPaymentMethod -> Order -> $3[ShowPixDetails / skip] -> DoneAndReview

$1 -> Pula caso o user esteja associado à um UUID.
$2 -> Pula caso o user já possua um endereço cadastrado.
