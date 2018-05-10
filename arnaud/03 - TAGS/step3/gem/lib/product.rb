module Shopify
  class Product
    class << self
      def all
        GET_PRODUCTS.map do |product|
          new(product)
        end
      end

      def find(product_id)
        unless product_id.is_a?(Integer)
          Error.raise_type(product_id, Integer, 'product_id')
        end

        all.find { |product| product.id == product_id }
      end

      def where(key, expected_value)
        all.select do |product|
          product_value = product.instance_variable_get("@#{key}")

          expected_value == product_value
        end
      end
    end

    AUTHORIZED = %i[id created_at published_at image title vendor price tags].freeze

    attr_accessor(*AUTHORIZED)

    def initialize(product_hash)
      product_hash.each do |key, value|
        set_variable(key, value)
      end
    end

    def set_variable(key, value)
      key = key.to_sym
      return unless AUTHORIZED.include?(key)

      modified_value =
        if key == :tags
          value.map { |tag_value| Tag.new(tag_value) }
        else
          value
        end

      instance_variable_set("@#{key}", modified_value)
    end
  end
end
