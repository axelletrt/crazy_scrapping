require 'open-uri'
require 'nokogiri'

#Méthode 1 
def get_the_email_of_a_townhal_from_its_webpage (url)
page = Nokogiri::HTML(open(url))
puts  links = page.css("td")[7]
end 
get_the_email_of_a_townhal_from_its_webpage ("http://annuaire-des-mairies.com/95/vaureal.html") 
    

#Méthode2
def get_all_the_urls_of_val_doise_townhalls (url)
    page = Nokogiri::HTML(open(url))
    news_links = page.css("a").select{|link| link['class'] == "lientxt"}
    new_links = news_links.each{|link| puts link['href']}
end 

get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")

