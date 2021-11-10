module AuthoritiesHelper

    def calculateDistance (lat1, lon1, lat2, lon2)
        @lat1.to_f
        @lat2.to_f
        @lon1.to_f
        @lon2.to_f
        @o1 = @lat1 * Math::PI/180
        @o2 = @lat2 * Math::PI/180
        @dl = (@lon2-@lon1) * Math::PI/180
        @R = 6371e3
        @d = Math::acos( Math::sin(@o1)*Math::sin(@o2) + Math::cos(@o1)*Math::cos(@o2) * Math::cos(@dl) ) * @R
        @dist = (@d/1000).round(2)
        return @dist
    end
end
