Dado('que estou logado como autoridade') do
    visit 'authorities/login'
    fill_in "Identifier", :with => "193"
    fill_in "Password", :with => "SenhaDosBombeirosTeste"
    click_on 'Login'
  end
  
  Quando('clico em um marker') do
    visit '/markers/' + (Marker.order("id").first).id.to_s
  end
  
  Então('deverei ver a página de detalhes do marker') do
    expect(page).to have_content('fire')
  end
  
  Então('deverei ver um botão de {string} desastre') do |string|
    expect(page).to have_content(string)
  end
  
  Então('não deverei ver um botão de {string} desastre') do |string|
    expect(page).not_to have_content(string)
  end
  
  Dado('estou na página de detalhes do marker') do
    visit '/markers/' + (Marker.order("id").first).id.to_s
  end
  
  Então('deverei ver uma mensagem de {string}') do |string|
    expect(page).to have_content(string)
  end

  Então('deverei ver {string}') do |string|
    expect(page).to have_content(string)
  end

  Então('deverei ser redirecionado para a página de perfil de usuário') do
    expect(page).to have_current_path("/users/profile")
  end