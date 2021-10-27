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

Então('o mapa deve falhar em ser exibido') do
  pending # Write code here that turns the phrase above into concrete actions
end