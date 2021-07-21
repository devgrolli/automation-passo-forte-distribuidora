
module PageEstoque
  module Login
    class Login < SitePrism::Page
      set_url '/'

      element :btn_logar, '#btn-logar'
      element :btn_voltar, '#btn-voltar'
      element :div_login, '#div-login'
      element :input_email, '#email'
      element :input_senha, '#senha'

      def realizar_login(login)
        dados = Manager.get_login(login)
        wait_until_div_login_visible
        input_email.set dados[:email]
        input_senha.set dados[:senha]
        btn_logar.click
      end
    end
  end
end