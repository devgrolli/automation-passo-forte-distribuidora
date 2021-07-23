# language:pt

@entradas @completo
Funcionalidade: Acessar site
  Eu como um usuário da aplicação
  Desejo realizar o login 
  Para que eu posso ter acesso ao gerenciamento de estoque

  Contexto:
    Dado que esteja logado na aplicação com o usuário 'login_default'

  @cadastrar_entrada
  Cenário: Realizar cadastro da entrada do produto
    Quando realize o cadastro de um novo produto
    E o produto ser cadastrado com sucesso
    E cadastrar entrada de 300 produtos no estoque com a validade na data atual
    Então validar que a entrada foi cadastrada
    E a quantidade do produto em estoque deverá ser atualizada

  @editar_entrada
  Cenário: Realizar edição da entrada do produto
    Quando realize o cadastro de um novo produto
    E o produto ser cadastrado com sucesso
    E cadastrar entrada de 300 produtos no estoque com a validade na data atual
    E valido que a entrada do produto foi cadastrado
    E editar a entrada do produto
    Então entrada deverá ser alterada com sucesso
    

