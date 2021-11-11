
Dado('que estou logado na tela de home') do
  visit 'login'
  fill_in "Username", :with => "rogerio_satrah"
  fill_in "Password", :with => "senhasecretaK"
  click_on 'Login' 
  visit '/'
end

Dado('que eu criei markers com meu usuário') do 
  marker1 = Marker.new(disaster_type: 'incendio', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").first).id, verified: false).save
end

Dado('que sou um usuário') do
  expect(page).to have_current_path("/index/user")
end

Então('os markers de usuário devem ser exibidos') do
  expect(page.find_by_id("data_self", visible: false).text).to_not have_text "[]"
  expect(page.find_by_id("data_pending", visible: false).text).to_not have_text "\"user_id\":" + (User.order("id").first).id.to_s
  expect(page.find_by_id("data_verified", visible: false).text).to_not have_text "\"user_id\":" + (User.order("id").first).id.to_s
end

Então('os markers não verificados devem ser exibidos') do
  expect(page).not_to have_css("#data_pending", text: "[]")
end

Então('os markers verificados devem ser exibidos') do
  expect(page).not_to have_css("#data_verified", text: "[]")
end