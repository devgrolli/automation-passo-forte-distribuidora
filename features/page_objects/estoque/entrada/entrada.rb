
module PageEstoque
  module Entrada
    class Entrada < SitePrism::Page
      
      element :input_obs, '#observacoes'
      element :input_qtd, '#quantidade'
      element :input_preco_un, '#valor'
      element :input_validade, '#validade'
      element :btn_entrada, '.btn-cadastrar-entrada'
      element :btn_cancelar, '.btn-cancelar-entrada'
      element :btn_ir_entrada, '#btn-entrada'
      elements :btn_exclusao, '.exclusao-entrada'
      elements :btn_edicao, '.edit-entrada'
      elements :selects_prod, '#produto_id option'
      elements :selects_fornecedor, '#fornecedor_id option'
      elements :selects_tipo_entrada, '#tipo_entrada_id option'
      elements :table, '#table tr'
      elements :all_inputs, '.form-control'

      def cadastrar_entrada(dados_produto, qtd)
        btn_ir_entrada.click
        wait_until_btn_ir_entrada_invisible
        selects_prod.find { |prod| prod.click if prod.text == dados_produto[1] }
        input_qtd.set qtd
        input_preco_un.set 500
        input_validade.set validade = Date.today.strftime('%d/%m/%Y')
        selects_fornecedor.first.click
        selects_tipo_entrada.find { |tipo_entrada| tipo_entrada.click if tipo_entrada.text == 'Reposição de estoque' }

        btn_entrada.click
        validade
      end

      def editar_entrada(dados)
        table.each_with_index { |selector, i| btn_edicao[i-1].click if selector.text.split.include?(dados[1]) }
        wait_until_btn_ir_entrada_invisible

        input_qtd.set quantidade = input_qtd.value.to_i + 30
        
        preco = input_preco_un.value.to_i + 3
        input_preco_un.native.clear
        input_preco_un.set preco.to_s + '00'
        price = input_preco_un.value

        input_validade.set validade = Date.today.next_month.strftime('%d/%m/%Y')
        selects_tipo_entrada.find { |tipo_entrada| tipo_entrada.click if tipo_entrada.text != 'Reposição de estoque' }
        input_obs.set 'TESTE DE ALTERAÇÃO'

        btn_entrada.click
        [dados[1], quantidade.to_s, price, validade]
      end
    end
  end
end