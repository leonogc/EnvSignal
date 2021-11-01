Dado('que estou logado no meu perfil') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
    visit 'login'
    fill_in "Username", :with => "rogerio_satrah"
    fill_in "Password", :with => "senhasecretaK"
    click_on 'Login' 
    expect(page).to have_current_path('/index/user')
end

Dado('que não estou logado') do
    visit 'login'
end

Quando('acesso a tela de edição de perfil') do
    visit '/users/edit'
end

Quando('clico em Save') do
    click_on 'Save'
end

Quando('tento acessar a tela de edição') do
    visit '/users/edit'
end

Então('deverei ver a mensagem {string}') do |string|
    expect(page).to have_content(string)
end

Então('ver o campo atualizado com {string}') do |string|
    expect(page).to have_content(string)
end