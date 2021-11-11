Dado('há markes criados por outros usuários no mapa') do
    user2 = User.new(name: "Aleatory", username:"ale",email:"ale@mail.com",birth_date: Date.parse("10/10/1000"), password:"holyhowdy").save
    marker1 = Marker.new(disaster_type: 'incendio', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false).save
  end
  
  Quando('clico no marker') do
    visit '/markers/' + (Marker.order("id").last).id.to_s
  end
  
  Então('devo ver os detalhes do marker') do
    expect(page).to have_content('incendio')
  end
  
  Dado('que estou logado na página do marker') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
    visit 'login'
    fill_in "Username", :with => "rogerio_satrah"
    fill_in "Password", :with => "senhasecretaK"
    click_on 'Login' 
    visit '/markers/' + (Marker.order("id").last).id.to_s
  end
  
  Quando('clico em {string}') do |string|
    click_on string
  end
  
  Então('devo ver a página de detalhes do marker') do
    expect(page).to have_current_path('/markers/' + (Marker.order("id").last).id.to_s)
  end
  
  Então('devo ver {string}') do |string|
    expect(page).to have_content(string)
  end
  
  Dado('sou o usuário que criou o marker') do
    expect((Marker.order("id").last).user_id).to eq((User.order("id").last).id)
  end

  Então('não devo ver o botão {string} ou {string}') do |string, string2|
    expect(page).not_to have_content(string + " | " + string2)
  end

  Dado('que já realizei {int}') do |int|
    voter1 = Voter.new(user_id: User.find_by(username: 'rogerio_satrah').id, marker_id: (Marker.order("id").last).id, vote: int).save
  end