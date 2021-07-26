namespace :pokemon do
  desc "TODO"
  task chargepokemons: :environment do
    pokemon = HTTParty.get "https://pokeapi.co/api/v2/pokemon?limit=150"
    result = JSON.parse pokemon.to_s

    

    result["results"].length.times do |i|
       #POKEMON INFORMATION
       pokemon_data = HTTParty.get result["results"][i]["url"]
       resultData = JSON.parse pokemon_data.to_s
 
       #POKEMON TYPE
       types = ''
       resultData["types"].length.times do |k|
         types += resultData["types"][k]["type"]["name"] + ','
       end
 
      #STATS
      hp = 0
      attack = 0
      defense = 0 
      special_attack = 0
      special_defense = 0
      speed = 0

       resultData["stats"].length.times do |j|
        statName = resultData["stats"][j]["stat"]["name"]
        if statName == 'hp'
          hp = resultData["stats"][j]["base_stat"]
        else 
          if statName == 'attack'
            attack = resultData["stats"][j]["base_stat"] #FALTA AÑADIR STAT EN BASE
          else
            if statName == 'defense'
              defense = resultData["stats"][j]["base_stat"]
            else
              if statName == 'special-attack'
                special_attack = resultData["stats"][j]["base_stat"]
              else
                if statName == 'special-defense'
                  special_defense = resultData["stats"][j]["base_stat"]
                else
                  speed = resultData["stats"][j]["base_stat"]
                end
              end
            end
          end
        end
       end
      #INSERT INTO DB
      Pokemon.create :name => result["results"][i]["name"], :description => "...", :types => types, :image_url => resultData["sprites"]["other"]["dream_world"]["front_default"] 
      PokemonStat.create :pokemon_id => resultData["id"], :hp => hp, :defense => defense, :special_attack => special_attack, :special_defense => special_defense, :speed => speed, :attack => attack
    end   
 
  
  
  put "Fueron añadidos " + result["results"].length.times + " Pokemons"
  puts "Tarea terminada"

  end

end
