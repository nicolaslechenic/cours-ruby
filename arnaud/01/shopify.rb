require 'shopify_api'
require 'dotenv/load'
require 'pry'

APIKEY   = ENV['SHOPIFY_KEY'].freeze
PASSWORD = ENV['SHOPIFY_PASSWORD'].freeze
SHOPNAME = 'theultimateshoptest'.freeze

url = "https://#{APIKEY}:#{PASSWORD}@#{SHOPNAME}.myshopify.com/admin"
ShopifyAPI::Base.site = url

products = ShopifyAPI::Product.all

binding.pry
