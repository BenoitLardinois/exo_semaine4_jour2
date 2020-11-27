require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#accueil
puts "-------------------------------------------------"
puts "|Bienvenu sur 'ILS VEULENT TOUS MA POO' !       |"
puts "|Le but du jeu est d'être le dernier survivnat !|"
puts "-------------------------------------------------"
puts " "

#initialisation du joueur
puts "---Votre prénom ?---"
print "> "
name = gets.chomp
user = HumanPlayer.new(name)
puts " "

#initialisation des ennemis
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

#le combat
while user.life_points >0 && (player1.life_points > 0 || player2.life_points > 0)
  puts " "
  print "> "
  puts "Voici l'état de santé de #{name}:"
  user.show_state
  puts " "
  
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleur arme"
  puts "s - chercher à se soigner"
  puts " "
  puts "Attaquer un joueur en vue ?"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  puts " "
  
  print "> "
  choice = gets.chomp 
  case choice
  when "a"
     user.search_weapon
  when "s"
     user.search_health_pack
  when "0"
     user.attacks(player1)
  when "1"
     user.attacks(player2)
  end
  puts " "
  
  if player1.life_points > 0 || player2.life_points > 0
    print "> "
    puts "Les bots attaques !"
    enemies.each do |i|
      if i.life_points > 0
        i.attacks(user)
      end
    end
  end
end

#fin du jeu
if (user.life_points > 0)
  puts "La partie est finie, tu as gangé!" 
else
  puts "La partie est finie, tu as perdus!"
end

#binding.pry