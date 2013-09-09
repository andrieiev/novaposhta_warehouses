#coding: utf-8
require 'nokogiri'
require 'yaml'
require 'open-uri'

class NovaPoshtaParser

  def initialize(path, filename = "novaposhta.yml")
    @path     = path
    @filename = filename
  end

  def go
    parse
    write_to_file
  end

  def parse
    table = page.css('table.t-tbl-ware').last

    last_city, last_region = nil, nil

    table.css('tr').each do |line|
      tds = line.css('td')
      name, data, phone = tds.map { |l| l.text.strip }

      if tds.first['class'] == "t-stdTblHeader"
        brackets_open  = name.rindex "("
        brackets_close = name.rindex ")"

        last_city   = name[0...brackets_open].strip
        last_region = name[(brackets_open+1)...brackets_close].strip
      end

      if name.index("отделение") || name.index("відділення")
        warehouses[last_region] ||= {}
        warehouses[last_region][last_city] ||= []
        warehouses[last_region][last_city] << {
          'number'  => get_number(name),
          'address' => get_address(data),
          'phone'   => phone.strip,
          'extra'   => get_extra(data)
        }
      end
    end

    warehouses
  end

  def warehouses
    @warehouses ||= {}
  end

  def page
    @page ||= Nokogiri::HTML(open(@path))
  end

  private

  def get_number(string)
    string.gsub(/\d+/).first
  end

  def get_address(string)
    string.gsub! "Отделение,", "Отделение:"
    pos = string.index ":"
    pos && string[(pos+1)..-1].strip || string.strip
  end

  def get_extra(string)
    pos = string.index ":"
    open_pos  = string.index "("
    if open_pos && pos && open_pos < pos
      close_pos = string.index ")"
      string[(open_pos+1)...close_pos].strip
    end
  end

  def write_to_file
    File.open(@filename, "w") { |f| f.write(warehouses.to_yaml) }
  end
end
