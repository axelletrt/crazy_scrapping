require 'open-uri'
require 'nokogiri'

def get_the_email_of_a_townhal_from_its_webpage (url)
    page = Nokogiri::HTML(open(url))
    page.css("td")[7].text
end 

def get_all_the_urls_of_val_doise_townhalls (url)
    page = Nokogiri::HTML(open(url))
    news_links = page.css("a").select{|link| link['class'] == "lientxt"}
    array = Array.new 
    news_links = news_links.each{|link| 
        hash = Hash.new 
        hash["ville"] = link.text 
        hash["email"] = get_the_email_of_a_townhal_from_its_webpage (linkhref = 'http://annuaire-des-mairies.com'+ link['href'][1..-1])
    
        array.push(hash)
    }

    print array 
end 

get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")

