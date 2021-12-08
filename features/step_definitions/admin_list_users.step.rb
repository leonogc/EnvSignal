Dado('que estou na página de listagem de usuários') do
    visit 'admin/list_users'
end

Então('deverei ver a lista de usuários da seguinte forma:') do |table|
    pending
end

Dado('que existe um usuário na lista') do
    expect(page).to have_content('rogerio_satrah')
end

Quando('clico em {string} do botão do usuário') do |string|
    id = (User.find_by(username: 'rogerio_satrah')['id'].to_s)
    elem = find(:xpath, "//a[contains(@href, "+  id + ") and contains(text(), '" + string + "')]", match: :first, wait: false)
    elem.click
end

Então('deverei ser redirecionado para a página de edição de usuário por administradores') do
    id = (User.find_by(username: 'rogerio_satrah')['id'].to_s)
    expect(page).to have_current_path("/admin/edit_user?user=" + id)
end

Então('o usuário deve ser removido da lista') do
    expect(page).not_to have_content('rogerio_satrah')
end