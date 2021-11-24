Dado('o marker está verificado') do
    (Marker.order("id").first).update(verified: true)
    visit '/markers/' + (Marker.order("id").first).id.to_s
    expect(page).to have_content("Verified: true")
end
  
Dado('o marker não está verificado') do
    expect(page).to have_content("Verified: false")
end

Quando('preencho o select {string} com {string}') do |string, string2|
    select string2, :from => string
end

Então('deverei ver a página de edição do marker') do
    expect(page).to have_content("Editing Marker")
end