class HoneymoonItem < ActiveRecord::Base
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  validates_uniqueness_of :url
  attr_accessible :url, :description, :location, :image_url

  def self.search
    url = "http://livingsocial.com/escapes"
    doc = Nokogiri::HTML(open(url))

    doc.css('.alt').each do |item|
      item_hash = Hash.new

      url = "http://livingsocial.com" + item.at_css('a')[:href]

      image = item.at_css('a img')
      if image.nil?
        break
      else
        image_url = resize_image(image[:src])
      end

      header = item.at_css('h2')
      if header.nil?
        break
      else
        description = header.text
      end

      paragraph = item.at_css('p')
      if paragraph.nil?
        break
      else
        location = paragraph.text
      end

      HoneymoonItem.create(
        url: url,
        image_url: image_url,
        description: description,
        location: location
      )
    end
    HoneymoonItem.all.reverse
  end

  def self.resize_image(url)
    url_match = url.match /(^.*)\//
    "http://res.cloudinary.com/bookis/image/fetch/w_190,h_190,c_fill,g_face/#{url_match[1]}.jpg"
  end
end