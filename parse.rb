#coding: utf-8
require './lib/parser'

parser_ru = NovaPoshtaParser.new('http://novaposhta.ua/frontend/brunchoffices/ru?alpha=all', 'novaposhta.ru.yml')
parser_ru.go

parser_ua = NovaPoshtaParser.new('http://novaposhta.ua/frontend/brunchoffices/?alpha=all', 'novaposhta.ua.yml')
parser_ua.go
