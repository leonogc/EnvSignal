Então('os markers devem ser exibidos') do
  expect(page).not_to have_css("#data", text: "[]")
end

Dado('que estou logado na tela de home') do
  user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
  visit 'login'
  fill_in "Username", :with => "rogerio_satrah"
  fill_in "Password", :with => "senhasecretaK"
  click_on 'Login' 
  visit '/'
end

Dado('que eu criei markers com meu usuário') do 
  marker1 = Marker.new(disaster_type: 'incendio', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false).save
end

Dado('que sou um usuário') do
  expect(page).to have_current_path("/index/user")
end

Então('os markers de usuário devem ser exibidos') do
  expect(page).not_to have_css("#data_self", text: "[]")
end