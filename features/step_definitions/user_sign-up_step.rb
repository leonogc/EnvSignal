Dado('que estou na página de cadastro de usuário') do
    visit '/users/new'
end

Quando('preencho o campo {string} com {string}') do |string, string2|
    fill_in string, :with => string2
end

Quando('clico em create') do
    click_on 'Create'
end

Então('ele deve ter sido salvo no banco de dados') do
    user = User.order("id").last
    expect(user.name).to eq("Rogerio Satrah Ka")
    expect(user.birth_date).to eq(Date.parse("17/10/1990"))
    expect(user.username).to eq("rogerio_satrah")
    expect(user.email).to eq("rogerio_satrah@gmail.com")
end

Então('deverei ser redirecionado para a página de login') do
    expect(page).to have_current_path("/users/login")
end

Quando('deixo o campo {string} vazio') do |string|
    fill_in string, :with => ""
end

Então('deverei ver a mensagem de erro {string}') do |string|
    expect(page).to have_content(string)
end