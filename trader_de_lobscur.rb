require 'open-uri'
require 'nokogiri'
require 'whenever'

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

trader("https://coinmarketcap.com/all/views/all/")




