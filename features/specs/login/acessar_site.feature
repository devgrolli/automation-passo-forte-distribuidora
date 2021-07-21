# language:pt

@acessar_site @completo
Funcionalidade: Acessar site
  Eu como um usuário da aplicação
  Desejo realizar o login 
  Para que eu posso ter acesso ao gerenciamento de estoque

  Contexto:
    Dado que acesse a página inicial

  @realizar_login
  Cenário: Realizar login
    Quando acessar a página de login
    E realizar o login 'login_default'
    Então validar que o usuário foi logado na aplicação

