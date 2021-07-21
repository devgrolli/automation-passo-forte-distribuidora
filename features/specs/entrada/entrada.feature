# language:pt

@entradas @completo
Funcionalidade: Acessar site
  Eu como um usuário da aplicação
  Desejo realizar o login 
  Para que eu posso ter acesso ao gerenciamento de estoque

  @cadastrar_entrada
  Cenário: Realizar login
    Dado que esteja logado na aplicação com o usuário 'login_default'
    Quando realize o cadastro de um novo produto
    E o produto ser cadastrado com sucesso
    E cadastrar entrada de 300 produtos no estoque com a validade '05/10/2021' do produto recem cadastrado
    Então validar que a entrada foi cadastrada
    E a quantidade do produto em estoque deverá ser atualizada

