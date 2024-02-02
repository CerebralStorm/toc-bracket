class Template2024
  attr_accessor :user
  
  def initialize(user)
    @user = user
  end

  def create_bracket
    east1 = [
      { name: 'Kelsey Barnard Clark', region: 'East' },
      { name: 'Jose Garces', region: 'East' }
    ]

    east2 = [
      { name: 'Stephanie Izard', region: 'East' },
      { name: 'Marc Murphy', region: 'East' }
    ]

    west1 = [
      { name: 'Carlos Anthony',  region: 'West' },
      { name: 'Shirley Chung', region: 'West' }
    ]

    west2 = [
      { name: 'Mei Lin', region: 'West' },
      { name: 'Antonia Lofaso', region: 'West' }
    ]

    matchups = [east1, east2, west1, west2]
    bracket = user.brackets.last || Bracket.create(user: user)

    matchups.each do |chefs|
      matchup = Matchup.create!(bracket_id: bracket.id)
      chefs.each do |chef|
        current_chef = Chef.where(name: chef[:name]).first
        matchup.matchup_chefs.where(chef_id: current_chef.id).first_or_create!
      end
    end
  end
end