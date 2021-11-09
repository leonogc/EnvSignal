Dado('que estou na página de login de administrador') do
    visit 'admin/login'
end

Então('deverei ver a página inicial de administrador') do
    expect(page).to have_current_path("/admin")
end
