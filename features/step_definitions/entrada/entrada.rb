Quando('realize o cadastro de um novo produto') do
  @home.acessar_page('Produtos')
  @produto = $page_estoque.produto
  @dados_produto = @produto.cadastrar_produto
end

Quando('o produto ser cadastrado com sucesso') do
  expect($page_estoque.produto).to have_content /Produto cadastrado com sucesso!/i
  puts "Produto cadastrado: #{@dados_produto}"
end

Quando('cadastrar entrada de {int} produtos no estoque com a validade {string} do produto recem cadastrado') do |qtd, validade|
  @home.acessar_page('Entradas')
  @entrada = $page_estoque.entrada
  @entrada.cadastrar_entrada(@dados_produto, @quantidade = qtd, validade)
end

Então('validar que a entrada foi cadastrada') do 
  expect($page_estoque.produto).to have_content /Entrada cadastrada com sucesso!/i 
end

Então('a quantidade do produto em estoque deverá ser atualizada') do
  @home.acessar_page('Estoque')
  expect(@home.get_table_estoque.any? { |procrura| procrura.text.split.eql?([@dados_produto[0].to_s, @dados_produto[1], @quantidade.to_s]) }).to be_truthy
end