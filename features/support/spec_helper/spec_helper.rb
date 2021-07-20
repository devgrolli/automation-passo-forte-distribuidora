module PageEstoque
  class Pages
    class << self
      def login
        PageEstoque::Login::Login.new
      end
    end
  end
end