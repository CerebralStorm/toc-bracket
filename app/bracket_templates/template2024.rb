class Template2024

  def create_matchups(rounds_remaining, current_matchup, template_bracket)
    return if rounds_remaining < 1
    match_1 = current_matchup.children.create(template_bracket: template_bracket, round_number: rounds_remaining)
    match_2 = current_matchup.children.create(template_bracket: template_bracket, round_number: rounds_remaining)
    create_matchups(rounds_remaining-1, match_1, template_bracket)
    create_matchups(rounds_remaining-1, match_2, template_bracket)
  end

  def create_bracket
    return if TemplateBracket.where(active: true).any?
    template_bracket = TemplateBracket.where(active: true).first_or_create!

    championship_matchup = Matchup.create(template_bracket: template_bracket, round_number: 5)
    create_matchups(4, championship_matchup, template_bracket)

    west_a1 = [
      { name: 'Brooke Williamson', seed: 1 },
      { name: 'Kevin Lee', seed: 8}
    ]

    west_a2 = [
      { name: 'Shirley Chung', seed: 4 },
      { name: 'Joe Sasto', seed: 5 }
    ]

    west_a3 = [
      { name: 'Antonia Lofaso', seed: 3 },
      { name: 'Casey Thompson', seed: 6 }
    ]

    west_a4 = [
      { name: 'Michael Voltaggio', seed: 2 },
      { name: 'Crista Luedtke', seed: 7 },
    ]

    update_matchups('West A', [west_a1, west_a2, west_a3, west_a4])

    west_b1 = [
      { name: 'Mei Lin', seed: 1 },
      { name: 'Michael Reed', seed: 8 }
    ]

    west_b2 = [
      { name: 'Adam Sobel', seed: 4 },
      { name: 'Lee Ann Wong', seed: 5 }
    ]

    west_b3 = [
      { name: 'Shota Nakajima', seed: 3 },
      { name: 'Carlos Anthony', seed: 6 }
    ]

    west_b4 = [
      { name: 'Jet Tila', seed: 2 },
      { name: 'Brian Malarkey', seed: 7 },
    ]

    update_matchups('West B', [west_b1, west_b2, west_b3, west_b4])

    east_a1 = [
      { name: 'Maneet Chauhan', seed: 1 },
      { name: 'Nini Nguyen', seed: 8 }
    ]

    east_a2 = [
      { name: 'Stephanie Izard', seed: 4 },
      { name: 'Eric Adjepong', seed: 5 }
    ]

    east_a3 = [
      { name: 'Tobias Dorzon', seed: 3 },
      { name: 'Kelsey Barnard Clark', seed: 6 }
    ]

    east_a4 = [
      { name: 'Karen Akunowicz', seed: 2 },
      { name: 'Dale Talde', seed: 7 },
    ]

    update_matchups('East A', [east_a1, east_a2, east_a3, east_a4])

    east_b1 = [
      { name: 'Tiffani Faison', seed: 1 },
      { name: 'Chris Scott', seed: 8 }
    ]

    east_b2 = [
      { name: 'Amanda Freitag', seed: 4 },
      { name: 'Darnell Ferguson', seed: 5 }
    ]

    east_b3 = [
      { name: 'Jose Garces', seed: 3 },
      { name: 'Marc Murphy', seed: 6 }
    ]

    east_b4 = [
      { name: 'Britt Rescigno', seed: 2 },
      { name: 'Jonathon Sawyer', seed: 7 },
    ]

    update_matchups('East B', [east_b1, east_b2, east_b3, east_b4])
  end

  def update_matchups(region_name, matches)
    matches.each do |chefs|
      matchup = Matchup.where(round_number: 1).order(:created_at).where.missing(:matchup_chefs).first
      matchup.update(region: region_name)
      chefs.each do |chef|
        current_chef = Chef.where(name: chef[:name]).first_or_create!
        matchup_chef = matchup.matchup_chefs.where(chef_id: current_chef.id).first_or_create!
        matchup_chef.update(seed: chef[:seed])
      end
    end
  end
end