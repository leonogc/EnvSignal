Dado('que estou na página de edição de usuários') do
    visit '/admin/edit_user?user=' + (User.find_by(username: 'rogerio_satrah')['id'].to_s)
end