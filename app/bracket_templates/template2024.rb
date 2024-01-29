class Template2024
  attr_accessor :user
  
  def initialize(user)
    @user = user
  end

  def create_bracket
    west1 = [
      'Eric Adjepong',
      'Karen Akunowicz'
    ]

    west2 = [
      'Kelsey Barnard Clark',
      'Maneet Chauhan'
    ]

    matchups = [west1, west2]
    bracket = user.brackets.last || Bracket.create(user: user)

    matchups.each do |chefs|
      chefs.each do |chef|
        matchup = Matchup.create!(bracket_id: bracket.id)
        current_chef = Chef.where(name: chef).first
        matchup.matchup_chefs.where(chef_id: current_chef.id).first_or_create!
      end
    end
  end
end

