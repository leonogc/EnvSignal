#language: pt

@oneAdminBefore
@oneUserBefore
Funcionalidade: Administrador - Listagem de Usuários
Como administrador
Eu quero poder visualizar os usuários cadastrados em forma de lista
Para que eu consiga visualizar as informações cadastradas e se existe algum cadastro com problemas

Cenário: Listagem dos Usuários
Dado que estou logado na conta de administrador
E que estou na página de listagem de usuários
Então deverei ver a lista de usuários da seguinte forma:
| Username        | Email                     | Name              | Birth Date | Created At | Actions       ||
| rogerio_satrah  | rogerio_satrah1@gmail.com | Rogerio Satrah Ka | 17/10/1990 | Date       | Edit | Destroy |

Cenário: Listagem dos Usuários com erro - Tentativa de acesso sem permissão
Dado que estou na página de listagem de usuários
Então deverei ser redirecionado para a página de login de administrador

Cenário: Editando um Usuário
Dado que estou logado na conta de administrador
E que estou na página de listagem de usuários
E que existe um usuário na lista
Quando clico em "Edit" do botão do usuário
Então deverei ser redirecionado para a página de edição de usuário por administradores

Cenário: Removendo um Usuário
Dado que estou logado na conta de administrador
E que estou na página de listagem de usuários
E que existe um usuário na lista
Quando clico em "Destroy" do botão do usuário
Então deverei ver a mensagem "User was successfully removed."
E o usuário deve ser removido da lista