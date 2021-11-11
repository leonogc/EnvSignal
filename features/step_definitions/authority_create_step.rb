Dado('que estou na página de cadastro de autoridade') do
    visit '/admin/create_authority'
end

Então('deverei ir para a página de listagem de autoridades') do
    visit '/admin/list_authorities'
end

Então('deverei encontrar o identificador {string} cadastrado') do |string|
    expect(page).to have_content(string)
end

Dado('que estou logado na conta de administrador') do
    visit 'admin/login'
    fill_in "Username", :with => "admin"
    fill_in "Password", :with => "admin123"
    click_on 'Login'
    expect(page).to have_current_path("/admin")
end

Dado('que não estou logado na conta de administrador') do
    visit 'admin/login'
end

Quando('tento acessar a página de cadastro de autoridade') do
    visit '/admin/create_authority'
end

Então('deverei ser redirecionado para a página de login de administrador') do
    expect(page).to have_current_path("/admin/login")
end