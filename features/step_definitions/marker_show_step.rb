Dado('que estou na página home do usuário') do
  visit '/user'
end


Então('os markers não verificados devem ser exibidos') do
  expect(page).not_to have_css("#data_pending", text: "[]")
end

Então('os markers verificados devem ser exibidos') do
  expect(page).not_to have_css("#data_verified", text: "[]")
end

Então('os markers de usuário verificados devem ser exibidos') do
  expect(page.find_by_id("data_self_verified", visible: false).text).to_not have_text "[]"
  expect(page.find_by_id("data_self_pending", visible: false).text).to have_text "[]"
  expect(page.find_by_id("data_pending", visible: false).text).to_not have_text "\"user_id\":" + (User.find_by(username: "rogerio_satrah")).id.to_s
  expect(page.find_by_id("data_verified", visible: false).text).to_not have_text "\"user_id\":" + (User.find_by(username: "rogerio_satrah")).id.to_s
end

Então('os markers de usuário não verificados devem ser exibidos') do
  expect(page.find_by_id("data_self_pending", visible: false).text).to_not have_text "[]"
  expect(page.find_by_id("data_self_verified", visible: false).text).to have_text "[]"
  expect(page.find_by_id("data_pending", visible: false).text).to_not have_text "\"user_id\":" + (User.find_by(username: "rogerio_satrah")).id.to_s
  expect(page.find_by_id("data_verified", visible: false).text).to_not have_text "\"user_id\":" + (User.find_by(username: "rogerio_satrah")).id.to_s
end
