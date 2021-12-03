  Quando('clico no marker') do
    visit '/markers/' + (Marker.order("id").last).id.to_s
  end
  
  Então('devo ver os detalhes do marker') do
    expect(page).to have_content('incendio')
  end
  
  Dado('estou na página do marker') do
    visit '/markers/' + (Marker.order("id").last).id.to_s
  end
  
  Quando('clico em {string}') do |string|
    click_on string
  end
  
  Então('devo ver a página de detalhes do marker') do
    expect(page).to have_current_path('/markers/' + (Marker.order("id").last).id.to_s)
  end
  
  Então('devo ver {string}') do |string|
    expect(page).to have_content(string)
  end
  
  Dado('sou o usuário que criou o marker') do
    expect((Marker.order("id").last).user_id).to eq((User.order("id").last).id)
  end

  Então('não devo ver o botão {string} ou {string}') do |string, string2|
    expect(page).not_to have_content(string + " | " + string2)
  end

  Dado('que já realizei {int}') do |int|
    voter1 = Voter.new(user_id: User.find_by(username: 'rogerio_satrah').id, marker_id: (Marker.order("id").last).id, vote: int).save
  end