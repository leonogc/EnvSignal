Dado('que estou na página home') do
  visit '/'
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

Dado('que estou na página home de autoridade') do
  visit '/authority'
end

Então('deverei ser redirecionado para a página de listagem de disastres') do
  expect(page).to have_current_path("/markers")
end