require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://www.bestadvice.ie/"))

doc.xpath("/html/body//tr").each do |e|
    puts e.text
end
