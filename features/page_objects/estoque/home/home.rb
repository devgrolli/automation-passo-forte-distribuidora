
module PageEstoque
  module Home
    class Home < SitePrism::Page
      set_url '/'
    
      element :btn_entrar, '#btn-entrar'
      element :label_aisde, '[class="brand-link "]'
      elements :menu_lateral, '[class="sidebar"] [class="nav-item"]'
      elements :table_estoque, '#table tr'

      def acessar_login
        wait_until_btn_entrar_visible
        btn_entrar.click
      end

      def acessar_page(type)
        menu_lateral.find { |nome_menu| nome_menu.click if nome_menu.text == type }
      end

      def get_table_estoque
        table_estoque
      end
    end
  end
end