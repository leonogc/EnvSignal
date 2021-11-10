module AuthoritiesHelper
include Math

    def calculateDistance (lat1, lon1, lat2, lon2)
        @lat1 = lat1.to_f
        @lat2 = lat2.to_f
        @lon1 = lon1.to_f
        @lon2 = lon2.to_f
        @o1 = @lat1 * Math::PI/180
        @o2 = @lat2 * Math::PI/180
        @dlat = (@lat2-@lat1) * Math::PI/180
        @dlon = (@lon2-@lon1) * Math::PI/180
        @R = 6371e3
        @a = Math::sin(@dlat/2) * Math::sin(@dlat/2) + Math::cos(@o1) * Math::cos(@o2) * Math::sin(@dlon/2) * Math::sin(@dlon/2)
        @c = 2 * Math::atan2(Math::sqrt(@a), Math::sqrt(1-@a))
        @d = (@c * @R)/1000
        @dist = @d.round(2)
        return @dist
    end
end
