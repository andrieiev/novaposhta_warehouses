require "bundler/gem_tasks"
require 'novaposhta_warehouses/parser'

namespace :novaposhta_warehouses do
  desc 'Parse novaposhta warehouses table to yml files.'
  task :parse do
    parser_ru = NovaposhtaWarehouses::Parser.new('http://novaposhta.ua/frontend/brunchoffices/ru?alpha=all', 'data/novaposhta.ru.yml')
    parser_ru.go

    parser_ua = NovaposhtaWarehouses::Parser.new('http://novaposhta.ua/frontend/brunchoffices/?alpha=all', 'data/novaposhta.ua.yml')
    parser_ua.go
  end
end
