Dado('que estou na página de login') do
    visit 'login'
  end
  
  Quando('clico em Login') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
    click_on 'Login'    
  end
  
  Então('devo logar na minha conta') do
    expect(session[:user_id]).to eq(user1.id)
  end
  
  Então('deverei ver a página home') do
    expect(page).to have_current_path('/')
  end
  
  Quando('a senha do usuário está incorreta') do
    expect(@user).to respond_to(authenticate).with(1).arguments
  end
  
  Quando('o username não existe') do
    pending # Write code here that turns the phrase above into concrete actions
  end