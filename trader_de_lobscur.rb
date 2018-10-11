require 'open-uri'
require 'nokogiri'

#Première méthode trouvée : donne comme résultat deux hashes dans un array. Tous les arrays se situent également dans un array global
#Voir autre méthode2 en commentaire (ci-dessous) pour sortir les résultats comme demandé dans le bonus ; 
#Avoir les urls dans un hash propre du genre { "name" => "nomDeLaVille", "email" => "ville@machin.chose" } 

def trader (url)
        page = Nokogiri::HTML(open(url))
        list_currency = page.xpath('//*[@id]/td[2]/a')
        list_rates=  page.xpath('//*[@id]/td[8]')
    
        array1 = Array.new 
        array2 = Array.new 

        list_currency = list_currency.each{|currency| 
        hash = Hash.new 
        hash["currency"] = currency.text
        array1.push(hash)
        }

        list_rates = list_rates.each{|rate| 
        hash2 = Hash.new 
        hash2["rate"] = rate.text 
        array2.push(hash2)
        }

    print tableau = [array1.zip(array2)]
end 


def perform 
    while true
    trader("https://coinmarketcap.com/all/views/all/")

    print "\nLa méthode sera relancée toutes les 3600 secondes, soit toutes les heures. Pour sortir de la méthode, utiliser la commande ctrl+c!\""
   
    sleep 3600
    end 
end 

perform


#Méthode2
#Méthode 100% fidèle au bonus (Pour enlever tous les commentaires d'un coup : Tout selectionner et faire ctrl+/ )

# require 'open-uri'
# require 'nokogiri'

# def trader (url)
#     page = Nokogiri::HTML(open(url))

#     list_line = page.xpath('//*[@id="currencies-all"]/tbody/tr')
#     list_currencies = Array.new

#     list_line.each { | line |
#         coin = Hash.new

#         currency = line.xpath('td[2]/a')
#         rates = line.xpath('td[8]')
        
#         coin['currency'] = currency.text
#         coin['rates'] = rates.text

#         list_currencies.push( coin )
#     }

#     list_currencies
# end

# print trader ("https://coinmarketcap.com/all/views/all/")
