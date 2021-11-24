Quando('acesso a listagem de desastres') do
    visit '/markers'
end

Então('os desastres devem ser exibidos') do
    expect(page).to have_current_path('/markers')
    expect(page).to have_content('incendio')  
    expect(page).to have_content('vazamento')  
    expect(page).to have_content('3832.85 Km')
    expect(page).to have_content('3845.82 Km')
end