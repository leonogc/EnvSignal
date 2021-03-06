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

    marker1 = Marker.new(disaster_type: 'fire', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false, user_type: 0).save
    marker2 = Marker.new(disaster_type: 'leak', latitude: 27.1232, longitude: -22.3323, user_id: (User.order("id").last).id, verified: false, user_type: 0).save

end

Before('@markersBeforeForResolve') do
    user1 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save

    marker1 = Marker.new(disaster_type: 'fire', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: true, user_type: 0).save
end

Before('@unverifyMarker') do
    marker = Marker.last
    marker.update(verified: false)
end

Before('@someMarkersBefore') do 
    user2 = User.new(name: "Rogerio Satrah Ka Junior",username: "rogerio_satrah_junior", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/2000"),password: "senhasecretaK").save

    marker2 = Marker.new(disaster_type: 'leak', latitude: 27.1232, longitude: -22.3323, user_id: (User.order("id").last).id, verified: true, user_type: 0).save
    
    marker3 = Marker.new(disaster_type: 'leak', latitude: 37.1232, longitude: -32.3323, user_id: (User.order("id").last).id, verified: false, user_type: 0).save
end

Before('@OneMarkerPendingFromUserBefore') do
    
    marker = Marker.new(disaster_type: 'leak', latitude: 37.1232, longitude: -32.3323, user_id: (User.find_by(username: "rogerio_satrah")).id, verified: false, user_type: 0).save
end

Before('@OneMarkerVerifiedFromUserBefore') do
    
    marker = Marker.new(disaster_type: 'leak', latitude: 27.1232, longitude: -22.3323, user_id: (User.find_by(username: "rogerio_satrah")).id, verified: true, user_type: 0).save
    
end

Before('@otherUserMarkerBefore') do
    user2 = User.new(name: "Aleatory", username:"ale",email:"ale@mail.com",birth_date: Date.parse("10/10/1000"), password:"holyhowdy").save
    marker1 = Marker.new(disaster_type: 'fire', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false, user_type: 0).save
end

Before('@otherAuthorityMarkerBefore') do
    authority4 = Authority.new(identifier: 192, name: "Samu", password: "SenhaDoSamuTeste").save
    marker1 = Marker.new(disaster_type: 'fire', latitude: 26.1232, longitude: -23.3323, user_id: (Authority.order("id").last).id, verified: false, user_type: 1).save
end

Before('@listMarkerBefore') do 
    user4 = User.new(name: "Rogerio Satrah Ka",username: "rogerio_satrah4", email: "rogerio_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save

    marker3 = Marker.new(disaster_type: 'fire', latitude: 26.1232, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false, user_type: 0).save

    marker4 = Marker.new(disaster_type: 'leak', latitude: 27.1232, longitude: -22.3323, user_id: (User.order("id").last).id, verified: false, user_type: 0).save

    authority3 = Authority.new(identifier: 193, name: "Corpo de Bombeiros", password: "SenhaDosBombeirosTeste").save
end

Before('@otherUserBefore') do
    user2 = User.new(name: "Roberto Satrah Ka",username: "ro_satrah", email: "rob_satrah1@gmail.com",birth_date: Date.parse("17/10/1990"),password: "senhasecretaK").save
end

Before('@otherAuthorityBefore') do
    authority2 = Authority.new(identifier: 190, name: "Policia", password: "SenhaDaPoliciaTeste").save
end

Before('@oneMarkerFromUser') do
    marker1 = Marker.new(disaster_type: 'fire', latitude: 23.4292, longitude: -23.3323, user_id: (User.order("id").last).id, verified: false, user_type: 0).save
end

Before('@oneMarkerFromAuthority') do
    authority3 = Authority.new(identifier: 193, name: "Corpo de Bombeiros", password: "SenhaDosBombeirosTeste").save
    
    marker5 = Marker.new(disaster_type: 'fire', latitude: 23.4292, longitude: -23.3323, user_id: (Authority.order("id").last).id, verified: false, user_type: 1).save
end