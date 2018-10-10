require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    @xml_menu.get_menu_price.each do |price|
      expect(price.text.to_i).to be < (10)
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @xml_menu.get_menu_item.each do |calories|
      if calories.xpath("name").text != "Full Breakfast"
        expect(calories.xpath("calories").text.to_i).to be < (1000)
      end
      # xinclude = ["Full Breakfast"]
    end
  end

  it "should have all waffle dishes stating you get two waffles" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @xml_menu.get_menu_item.each do |waffle|
      if waffle.xpath("name").text.downcase.include? "waffle"
        expect(waffle.xpath("description").text.downcase.include?("two")).to be(true)
      end
      # xinclude = ["Full Breakfast"]
    end
  end

end
