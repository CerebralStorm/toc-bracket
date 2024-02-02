# frozen_string_literal: true
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


[
  { name: 'Kelsey Barnard Clark', region: 'East' },
  { name: 'Jose Garces', region: 'East' },
  { name: 'Stephanie Izard', region: 'East' },
  { name: 'Marc Murphy', region: 'East' },
  { name: 'Britt Rescigno', region: 'East' },
  { name: 'Jonathon Sawyer', region: 'East' },
  { name: 'Dale Talde', region: 'East' },
  { name: 'Eric Adjepong', region: 'East' },
  { name: 'Amanda Freitag', region: 'East' },
  { name: 'Tiffani Faison', region: 'East' },
  { name: 'Karen Akunowicz', region: 'East' },
  { name: 'Tobias Dorzon', region: 'East' },
  { name: 'Carlos Anthony',  region: 'West' },
  { name: 'Shirley Chung', region: 'West' },
  { name: 'Mei Lin', region: 'West' },
  { name: 'Antonia Lofaso', region: 'West' },
  { name: 'Crista Luedtke', region: 'West' },
  { name: 'Brian Malarkey', region: 'West' },
  { name: 'Shota Nakajima', region: 'West' },
  { name: 'Joe Sasto', region: 'West' },
  { name: 'Adam Sobel', region: 'West' },
  { name: 'Casey Thompson', region: 'West' },
  { name: 'Jet Tila', region: 'West' },
  { name: 'Michael Voltaggio', region: 'West' },
  { name: 'Brooke Williamson', region: 'West' },
  { name: 'Lee Ann Wong', region: 'West' },
].each { |attrs| Chef.where(attrs).first_or_create }
  

# name: 'Nate Appleman', region: 'West'
# name: 'Tim Hollingsworth', region: 'West'
# name: 'Aaron May', region: 'West'
# name: 'Tiffany Derry', region: 'West'
# name: 'Phillip Frankland Lee', region: 'West'
# name: 'Shirley Chung', region: 'West'
# name: 'Chris Cosentino', region: 'West'
# name: 'Elizabeth Falkner', region: 'West'
# name: 'Marcel Vigneron', region: 'West' 
# name: 'Maneet Chauhan', region: 'West'
# name: 'Kelsey Barnard Clark', region: 'West'
# name: 'Bryan Voltaggio', region: 'West'
# name: 'Madison Cowan', region: 'West'
# name: 'Richard Hales', region: 'West'
# name: 'Christian Petroni', region: 'West'
# name: 'Michael Psilakis', region: 'West'
# name: 'Justin Sutherland', region: 'West'
# name: 'Einat Admony', region: 'West'
# name: 'Aarthi Sampath', region: 'West'