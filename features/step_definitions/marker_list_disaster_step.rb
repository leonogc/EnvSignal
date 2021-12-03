Então('os desastres e suas distâncias devem ser exibidas') do
    expect(page).to have_content('incendio')  
    expect(page).to have_content('vazamento')  
    expect(page).to have_content('3832.85 Km')
    expect(page).to have_content('3845.82 Km')
end

Então('deverei ver a lista de desastres com todos os botões que me são permitidos') do

end