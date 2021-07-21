
module PageEstoque
  module Entrada
    class Entrada < SitePrism::Page
      
      element :input_obs, '#observacoes'
      element :input_qtd, '#quantidade'
      element :input_preco_un, '#valor'
      element :input_validade, '#validade'
      element :btn_entrada, '#btn-cadastrar-entrada'
      element :btn_ir_entrada, '#btn-entrada'
      elements :selects_prod, '#produto_id option'
      elements :selects_fornecedor, '#fornecedor_id option'
      elements :selects_tipo_entrada, '#tipo_entrada_id option'

      def cadastrar_entrada(dados_produto, qtd, validade)
        btn_ir_entrada.click
        wait_until_btn_ir_entrada_invisible
        selects_prod.find { |prod| prod.click if prod.text == dados_produto[1] }
        input_qtd.set qtd
        input_preco_un.set 500
        input_validade.set validade
        selects_fornecedor.first.click
        selects_tipo_entrada.find { |tipo_entrada| tipo_entrada.click if tipo_entrada.text == 'Reposição de estoque' }

        btn_entrada.click
        validade
      end
    end
  end
end