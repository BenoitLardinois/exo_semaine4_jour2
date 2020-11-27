require 'pry'

class Player
  attr_accessor :name, :life_points
  
  def initialize(name)
    @name = name
    @life_points = 10
  end
  
  def show_state
    puts "#{@name} a #{@life_points} points de vies!"
  end
  
  def gets_damage(damage)
    @life_points = @life_points - damage
    if @life_points <= 0
      puts "Le joueur #{@name} est mort"
    else
      #nothing
    end
  end
  
  def compute_damage
    return rand(1..6)
  end
  
  def attacks(a_player)
    dice = compute_damage()
    puts "Le joueur #{@name} attaque le joueur #{a_player.name} !"
    puts "il lui inflige #{dice} points de dommages"
    a_player.gets_damage(dice)
  end
end

#########################################

class HumanPlayer < Player
  attr_accessor :weapon_level 
  
  def initialize(name)
    @life_points = 100
    @weapon_level = 1
  end
  
   def show_state
    puts "#{@name} a #{@life_points} points de vies et une arme de niveau #{@weapon_level} !"
  end
  
  def compute_damage
    rand(1..6) * @weapon_level
  end
  
  def search_weapon
    level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{level}"
    if level > @weapon_level 
      puts "Youhou! elle est meilleur que ton arme actuelle: tu la prends"
      @weapon_level = @weapon_level + level
    else 
      level = @weapon_level 
      puts "M@*#... elle n'est pas mieux que ton arme actuelle..."
    end
  end
  
  def search_health_pack
    life = rand(1..6)
    case life
    when 1
      puts "Tu n'as rien trouvé"
    when 2..5
      puts "Bravo, tu as trouvé un pack de +50 points de vies"
      @life_points +=
      @life_points = @life_points >= 100 ? 100 : @life_points
      #les points de vie ne doivent pas dépasser 100
    when 6
      puts "Waow, tu as trouvé un pack de +80 points de vies"
      @life_points += 80
      @life_points = @life_points >= 100 ? 100 : @life_pointss
    end
  end
end




#binding.pry