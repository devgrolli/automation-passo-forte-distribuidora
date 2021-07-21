
module PageEstoque
  module Produto
    class Produto < SitePrism::Page
      set_url '/'
        
      element :btn_cadastrar, '#btn-cadastrar-produto'
      element :input_id, '#id'
      element :input_nome, '#nome'
      element :input_unidade, '#unidade'
      element :input_marca, '#marca'
      element :submit_produto, '#cadastrar'
      elements :select_categorias, '#categorias_id option'
  
      def cadastrar_produto
        dados = Manager.get_produto('produto1')
        wait_until_btn_cadastrar_visible
        btn_cadastrar.click
        input_id.set id = Faker::Number.number(digits: 5)
        input_nome.set produto = dados[:nome] + Faker::Number.number(digits: 3).to_s
        input_unidade.set dados[:unidade]
        input_marca.set dados[:marca]
        select_categorias.find { |selector| selector.click if selector.text == dados[:categoria] }
        submit_produto.click

        [id, produto]
      end
    end
  end
end