Dado('que estou na página de login de autoridades') do
    visit 'authorities/login'
end

Então('deverei ver a página com o mapa de desastres') do
    expect(page).to have_current_path('/authority')
end