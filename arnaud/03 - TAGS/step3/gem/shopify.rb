require 'json'
require 'yaml'
require 'pry'

require_relative './lib/error'
require_relative './lib/product'
require_relative './lib/tag'

module Shopify
  # SIMULATE API ENDPOINT
  ROOT_PATH     = File.dirname(__FILE__)
  API_PATH      = "#{ROOT_PATH}/../api".freeze
  GET_PRODUCTS  = JSON.parse(File.read("#{API_PATH}/get_products.json")).freeze
  ERRORS        = YAML.load_file("#{ROOT_PATH}/config/errors.yml").freeze
end
