class Manager
  def initialize
    open()
  end

  def self.get_login(tag) 
    login = $login_manager.find { |login| login[:tag].index(/#{tag}/i) != nil }
    login
  end

  def self.get_mensg(tag) 
    mensagem = $mensagem_manager.find { |mensagem| mensagem[:tag].index(/#{tag}/i) != nil }
    mensagem
  end

  def self.get_produto(tag) 
    produto = $produto_manager.find { |produto| produto[:tag].index(/#{tag}/i) != nil }
    produto
  end
end