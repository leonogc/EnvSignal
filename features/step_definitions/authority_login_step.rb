Dado('que estou na página de login de autoridades') do
    visit 'authorities/login'
end

Então('deverei ver a página de listagem de desastres') do
    expect(page).to have_current_path("/authorities")
end