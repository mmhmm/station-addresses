#!/usr/bin/env ruby

require 'csv'
require 'nokogiri'
require 'open-uri'

CSV.open('output.csv', 'wb') do |output|
  CSV.foreach('station_codes.csv', headers: true) do |row|
    code = row['CRS Code']
    name = row['Station Name']

    begin
      details_html = Nokogiri::HTML(open("http://www.nationalrail.co.uk/stations/#{code}/details.html",
                                         "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:55.0) Gecko/20100101 Firefox/55.0"))
      addr_scrape  = details_html.css('address')[0].text.gsub(/^\s+$\n?/, '').split(/\r\n/)
      postcode     = addr_scrape.last.strip
      address      = addr_scrape[0..-2].collect(&:strip).join(', ')
    rescue OpenURI::HTTPError => e
      if e.message == '404 Not Found'
        postcode = 'Unknown'
        address  = 'Unknown'
      else
        raise e
      end
    end

    output << [code, name, postcode, address]
    sleep 5
  end
end
