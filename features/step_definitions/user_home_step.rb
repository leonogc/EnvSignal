Dado('que estou na página home') do
  visit '/homes'
end

Quando('a página é carregada') do
  uri = URI.parse('https://maps.googleapis.com/maps/api/js?key=AIzaSyBLCFpYycOKx17cjeZeBltPQ4WK792ms9A')
  response = Net::HTTP.get_response(uri)
end

Então('o mapa deve ser exibido') do
  uri = URI.parse('https://maps.googleapis.com/maps/api/js?key=AIzaSyBLCFpYycOKx17cjeZeBltPQ4WK792ms9A')
  response = Net::HTTP.get_response(uri)
  expect(response).to be_kind_of(Net::HTTPSuccess)
end

Quando('eu clico e seguro no mapa por {int} segundo') do |int|
# Quando('eu clico e seguro no mapa por {float} segundo') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('seleciono o tipo do desastre') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('deve começar o processo de adição do desastre') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('eu clico e seguro no mapa no pin de um desastre por {int} segundo') do |int|
# Quando('eu clico e seguro no mapa no pin de um desastre por {float} segundo') do |float|
  pending # Write code here that turns the phrase above into concrete actions
end

Então('deve mostrar as informações desse desastre') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('eu clico e seguro no mapa no pin de um desastre que eu vi ser verdadeiro') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('pressiono o botão confirm') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('minha validação deve ser encaminhada para o sistema') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('eu clico e seguro no mapa no pin de um desastre que eu vi ser falso') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('pressiono o botão reject') do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando('eu pressiono o ícone de Notificação') do
  pending # Write code here that turns the phrase above into concrete actions
end

Então('é exibido minhas últimas Notificações de desastres próximos e feedback dos meus desastres recentes') do
  pending # Write code here that turns the phrase above into concrete actions
end