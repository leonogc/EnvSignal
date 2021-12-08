Dado('que estou na página de login de usuário') do
    visit '/users/login'
  end
  
  Quando('clico em Login') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
    click_on 'Login'    
  end
  
  Então('deverei ver a página home') do
    expect(page).to have_current_path('/user')
  end

  Então('deverei ser redirecionado para a página de perfil de autoridade') do
    expect(page).to have_current_path('/authorities/profile')
  end

  Quando('clico em logar como autoridade') do
    click_on 'sign in as authority'
  end

  Então('deverei ser redirecionado para a tela de login de autoridade') do
    expect(page).to have_current_path('/authorities/login')
  end
  