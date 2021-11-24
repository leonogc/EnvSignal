Quando('tento acessar a tela de cadastro de marker') do
  visit '/markers/new'
end

Dado('que estou logado como usuário') do
  user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
  visit '/users/login'
  fill_in "Username", :with => "rogerio_satrah"
  fill_in "Password", :with => "senhasecretaK"
  click_on 'Login' 
end

Dado('estou na tela de cadastro de marker') do
  visit '/markers/new'
end

Então('deverei ser redirecionado para a página do marker') do
  expect(page).to have_current_path('/markers/' + (Marker.order("id").last).id.to_s)
end

Quando('preencho o campo {string} com {float}') do |string, float|
  fill_in string, :with => float
end

Quando('seleciono a opção {string} no select {string}') do |string1, string2|
  select string1, :from => string2
end

Então('o marker deve ter sido salvo no banco de dados') do
  marker = Marker.order("id").last
    expect(marker.upvotes).to eq(0)
    expect(marker.downvotes).to eq(0)
    expect(marker.disaster_type).to eq("vazamento")
    expect(marker.latitude).to eq(27.323222)
    expect(marker.longitude).to eq(-25.323283)
    expect(marker.obs).to eq("Está pegando fogo!")
end