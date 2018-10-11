require 'open-uri'
require 'nokogiri'

#méthode qui récupère l'email à partir de la page du député 

def get_email_deputy(url)
     page = Nokogiri::HTML(open(url))
     page.xpath('//*[@id="b1"]/ul[2]/li[1]/ul/li[1]/a').text
end 


#méthode qui récupère tous les urls de la page nosdeputes.fr/deputes 
#Important: Attendre entre 5/10 minutes pour voir les premiers résultats
#La méthode boucle sur les urls des 594 députés de la 15ème législature..Patience!
# Le programme fonctionne très bien et permet d'obtenir les 3 hashes demandés avec tous les hashes inclus dans un array: 
#{"first_name"=> " ", "last_name"=>" ", "email"=> " "}

 def get_url_deputes (url)
 doc = Nokogiri::HTML(open(url))
 div_classes = doc.xpath('//div[@class="list_table"]')
 all_a = div_classes.css('a')       

 array = Array.new 

 all_a.each{|element| 
    hash= Hash.new 
    first_last_name = element.css(".list_nom").text.strip!.split(", ")
    hash["first_name"] = first_last_name[1]
    hash["last_name"] = first_last_name[0]
    hash["email"] = get_email_deputy('https://nosdeputes.fr'+element["href"])

    array.push(hash)
}
    print array

 end 

get_url_deputes("https://www.nosdeputes.fr/deputes")

