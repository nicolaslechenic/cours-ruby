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
          raise TypeError, format(
            ERRORS['type'],
            current_type: product_id.class,
            expected_type: 'Integer',
            attr_name: 'product_id'
          )
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

    attr_accessor :id, :created_at, :published_at, :image, :title, :vendor, :price, :tags

    def initialize(product_hash)
      product_hash.each do |key, value|
        key = key.to_sym
        value = value.map { |tag_value| Tag.new(tag_value) } if key == :tags

        instance_variable_set("@#{key}", value)
      end
    end
  end
end
