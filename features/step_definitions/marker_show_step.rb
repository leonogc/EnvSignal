Então('os markers devem ser exibidos') do
  expect(page).not_to have_css("#data", text: "[]")
end