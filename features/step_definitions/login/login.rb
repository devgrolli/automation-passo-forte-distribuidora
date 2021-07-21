Quando('acessar a página de login') do
  @home = $page_estoque.home
  @home.acessar_login
end

Quando('realizar o login {string}') do |login|
  @login = $page_estoque.login
  @login.realizar_login(login)
end

Então('validar que o usuário foi logado na aplicação') do
  expect($page_estoque.home).to have_label_aisde
  expect(page).to have_content /Passo Forte/i
end

Dado('que esteja logado na aplicação com o usuário {string}') do |login|
  steps "Dado que acesse a página inicial
         Quando acessar a página de login
         Quando realizar o login '#{login}'
         Então validar que o usuário foi logado na aplicação"
end