Before('@oneUserBefore') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
end

Before('@oneAuthorityBefore') do
    authority1 = Authority.new(identifier: 193, name: "Corpo de Bombeiros", password: "SenhaDosBombeirosTeste").save
end

Before('@someMarkersBefore') do 
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save

    marker1 = Marker.new(disaster_type: 'incendio', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, upvotes: 0, downvotes: 0, verified: false).save

    marker2 = Marker.new(disaster_type: 'vazamento', latitude: 27.1232, longitude: -22.3323, user_id: (User.order("id").last).id, upvotes: 0, downvotes: 0, verified: false).save
end
