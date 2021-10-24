Dado('que estou logado no meu perfil') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
    visit 'login'
    fill_in "username", :with => "rogerio_satrah"
    fill_in "password", :with => "senhasecretaK"
    click_on 'Login' 
    expect(page).to have_current_path('/')
end

Dado('que não estou logado') do
    visit 'login'
end

Quando('clico em Profile e clico em Edit') do
    visit 'edit'
end

Quando('clico em Save') do
    click_on 'Save'
end

Quando('tento acessar a tela de edição') do
    visit 'edit'
end

Então('deverei ver a mensagem {string}') do |string|
    expect(page).to have_current_path('/profile')
    expect(page).to have_content(string)
end

Então('ver o campo {string} preenchido com {string}') do |string, string2|
    expect(string).to eq(string2)
end