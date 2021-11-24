Dado('que estou logado como autoridade na página home') do
    visit 'authorities/login'
    fill_in "Identifier", :with => "193"
    fill_in "Password", :with => "SenhaDosBombeirosTeste"
    click_on 'Login'
  end
  
  Quando('clico em um marker') do
    user2 = User.new(name: "Aleatory", username:"ale",email:"ale@mail.com",birth_date: Date.parse("10/10/1000"), password:"holyhowdy").save
    marker1 = Marker.new(disaster_type: 'incendio', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false).save
    visit '/markers/' + (Marker.order("id").last).id.to_s
  end
  
  Então('deverei ver a página de detalhes do marker') do
    expect(page).to have_content('incendio')
  end
  
  Então('deverei ver um botão de {string} desastre') do |string|
    expect(page).to have_content(string)
  end
  
  Dado('que não estou logado como autoridade na página home') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
    visit '/users/login'
    fill_in "Username", :with => "rogerio_satrah"
    fill_in "Password", :with => "senhasecretaK"
    click_on 'Login'
  end
  
  Então('não deverei ver um botão de {string} desastre') do |string|
    expect(page).not_to have_content(string)
  end
  
  Dado('que estou logado como autoridade na página de detalhes do marker') do
    visit 'authorities/login'
    fill_in "Identifier", :with => "193"
    fill_in "Password", :with => "SenhaDosBombeirosTeste"
    click_on 'Login'
    user2 = User.new(name: "Aleatory", username:"ale",email:"ale@mail.com",birth_date: Date.parse("10/10/1000"), password:"holyhowdy").save
    marker1 = Marker.new(disaster_type: 'incendio', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false).save
    visit '/markers/' + (Marker.order("id").last).id.to_s
  end
  
  Então('deverei ver uma mensagem de {string}') do |string|
    expect(page).to have_content(string)
  end

  Então('deverei ver {string}') do |string|
    expect(page).to have_content(string)
  end