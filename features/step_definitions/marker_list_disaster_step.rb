Dado('que estou logado como autoridade') do
    visit 'authorities/login'
    fill_in "Identifier", :with => "193"
    fill_in "Password", :with => "SenhaDosBombeirosTeste"
    click_on 'Login' 
    expect(page).to have_current_path('/authorities')
end

Quando('acesso a listagem de desastres') do
    visit '/markers'
end

Então('os desastres devem ser exibidos') do
    expect(page).to have_current_path('/markers')
    expect(page).to have_content('incendio')  
    expect(page).to have_content('vazamento')  
    expect(page).to have_content('6052.83 Km')
    expect(page).to have_content('6196.82 Km')
end