require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_menu_price
    @menu.xpath("//price")
  end

  def get_menu_item
    @menu.xpath("//food")
  end

  # Place your methods here

end
