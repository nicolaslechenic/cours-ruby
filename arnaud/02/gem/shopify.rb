require 'json'
require 'yaml'
require 'pry'

require_relative './lib/product'

module Shopify
  # SIMULATE API ENDPOINT
  GET_PRODUCTS  = JSON.parse(File.read('../api/get_products.json')).freeze
  ERRORS        = YAML.load_file('./config/errors.yml').freeze
end
