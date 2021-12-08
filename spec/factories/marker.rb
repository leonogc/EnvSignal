FactoryBot.define do
    factory :marker_verified do
        disaster_type { 'fire' }
        latitude { 26.1232 }
        longitude { -23.3323 }
        user_id { 1 }
        upvotes { 0 }
        downvotes { 0 }
        verified { true }
    end
end

FactoryBot.define do 
    factory :marker do 
        disaster_type { 'fire' }
        latitude { 26.1232 }
        longitude { -23.3323 }
        sequence(:user_id){ |n|} 
        user_id { 1 }
        upvotes { 0 }
        downvotes { 0 }
        verified { true }
    end
end
    