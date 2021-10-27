Before('@oneUserBefore') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
end

Before('@oneAuthorityBefore') do
    authority1 = Authority.new(identifier: 193, name: "Corpo de Bombeiros", password: "SenhaDosBombeirosTeste").save
end