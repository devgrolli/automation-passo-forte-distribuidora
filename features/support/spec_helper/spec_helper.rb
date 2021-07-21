module PageEstoque
  class Pages
    class << self
      def login
        PageEstoque::Login::Login.new
      end

      def home
        PageEstoque::Home::Home.new
      end

      def entrada
        PageEstoque::Entrada::Entrada.new
      end

      def produto
        PageEstoque::Produto::Produto.new
      end
    end
  end
end