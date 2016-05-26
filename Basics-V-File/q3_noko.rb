require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://www.hostels.com/"))

doc.xpath("/html/body/div/div/div/div/div").children.each do |e|
    puts e.text
end