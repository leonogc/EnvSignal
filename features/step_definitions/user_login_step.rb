Dado('que estou na página de login') do
    visit 'login'
  end
  
  Quando('preencho o campo {string} com {string}') do |string, string2|
    fill_in string, :with  => string2 
  end
  
  Quando('clico em Login') do
    click_on 'Fazer login'
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
  end
  
  Então('devo logar na minha conta') do
    expect(session[:user_id]).to eq(user1.id)
  end
  
  Então('deverei ver a página home') do
    expect(page).to have_current_path(@root)
  end
  
  Quando('a senha do usuário está incorreta') do
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Então('deverei ver a mensagem de erro {string}') do |string|
    pending # Write code here that turns the phrase above into concrete actions
  end
  
  Quando('o username não existe') do
    pending # Write code here that turns the phrase above into concrete actions
  end