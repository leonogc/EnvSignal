Então('não deverei ver {string}') do |string|
    expect(page).not_to have_content(string)
end