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
  'Jet Tila',
  'Carlos Anthony', 
  'Brian Malarkey',
  'Lee Ann Wong',
  'Nate Appleman',
  'Adam Sobel',
  'Brooke Williamson',
  'Michael Voltaggio',
  'Tim Hollingsworth',
  'Aaron May',
  'Tiffany Derry',
  'Phillip Frankland Lee',
  'Crista Luedtke',
  'Antonia Lofaso',
  'Shirley Chung',
  'Chris Cosentino',
  'Elizabeth Falkner',
  'Marcel Vigneron',
  'Joe Sasto',
  'Maneet Chauhan',
  'Amanda Freitag',
  'Tiffani Faison',
  'Kelsey Barnard Clark',
  'Eric Adjepong',
  'Bryan Voltaggio',
  'Madison Cowan',
  'Richard Hales',
  'Christian Petroni',
  'Michael Psilakis',
  'Karen Akunowicz',
  'Justin Sutherland',
  'Einat Admony',
  'Tobias Dorzon',
  'Aarthi Sampath',
  'Eric Adjepong',
  'Karen Akunowicz',
  'Kelsey Barnard Clark',
  'Tobias Dorzon',
  'Jose Garces',
  'Stephanie Izard',
  'Marc Murphy',
  'Britt Rescigno',
  'Jonathon Sawyer,',
  'Dale Talde',
  'Shirley Chung',
  'Mei Lin',
  'Shota Nakajima',
  'Joe Sasto',
  'Casey Thompson'
].each { |name| Chef.where(name: name).first_or_create }