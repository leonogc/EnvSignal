Before('@oneUserBefore') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
end

Before('@oneAuthorityBefore') do
    authority1 = Authority.new(identifier: 193, name: "Corpo de Bombeiros", password: "SenhaDosBombeirosTeste").save
end

Before('@oneAdminBefore') do
    admin1 = Admin.new(username: 'admin', password: "admin123").save
end

Before('@markersBeforeForConfirm') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save

    marker1 = Marker.new(disaster_type: 'incendio', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false).save
    marker2 = Marker.new(disaster_type: 'vazamento', latitude: 27.1232, longitude: -22.3323, user_id: (User.order("id").last).id, verified: false).save

end

Before('@someMarkersBefore') do 
    user2 = User.new(name: "Rogerio Satrah Ka Junior",username: "rogerio_satrah_junior", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/2000"),password: "senhasecretaK").save

    marker2 = Marker.new(disaster_type: 'vazamento', latitude: 27.1232, longitude: -22.3323, user_id: (User.order("id").last).id, verified: true).save
    
    marker3 = Marker.new(disaster_type: 'vazamento', latitude: 37.1232, longitude: -32.3323, user_id: (User.order("id").last).id, verified: false).save
end

Before('@otherUserMarkerBefore') do
    user2 = User.new(name: "Aleatory", username:"ale",email:"ale@mail.com",birth_date: Date.parse("10/10/1000"), password:"holyhowdy").save
    marker1 = Marker.new(disaster_type: 'incendio', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false).save
end

Before('@listMarkerBefore') do 
    user4 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah4", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save

    marker3 = Marker.new(disaster_type: 'incendio', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false).save

    marker4 = Marker.new(disaster_type: 'vazamento', latitude: 27.1232, longitude: -22.3323, user_id: (User.order("id").last).id, verified: false).save

    authority3 = Authority.new(identifier: 193, name: "Corpo de Bombeiros", password: "SenhaDosBombeirosTeste").save
end

Before('@otherAuthorityBefore') do
    authority2 = Authority.new(identifier: 190, name: "Policia", password: "SenhaDaPoliciaTeste").save
end