Dado('que estou na página de login da home') do
  visit '/login'
end

Quando('eu clico em Ir para Login de Usuário') do
  click_link("user-link")
end

Quando('eu clico em Ir para Login de Autoridade') do
  click_link("authority-link")
end

Então('deverei ser redirecionado para a página de login de autoridade') do
  expect(page).to have_current_path("/authorities/login")
end

Então('deverei ser redirecionado para a página principal dos usuários') do
  expect(page).to have_current_path("/user")
end

Então('deverei ser redirecionado para a página principal das autoridades') do
  expect(page).to have_current_path("/authority")
end
