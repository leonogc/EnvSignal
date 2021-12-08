Dado('que estou na página de login de autoridades') do
    visit 'authorities/login'
end

Então('deverei ver a página com o mapa de desastres') do
    expect(page).to have_current_path('/authority')
end

Quando('clico em logar como usuário') do
    find('.user_login_link').click
end
  
Então('deverei ser redirecionado para a tela de login de usuário') do
    expect(page).to have_current_path('/users/login')
end