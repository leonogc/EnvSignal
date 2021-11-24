Dado('que estou na página de login') do
    visit '/users/login'
  end
  
  Quando('clico em Login') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
    click_on 'Login'    
  end
  
  Então('deverei ver a página home') do
    expect(page).to have_current_path('/user')
  end