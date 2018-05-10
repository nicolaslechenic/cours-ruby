module Shopify
  class Error
    def self.raise_type(attribut, expected_type, attribut_name)
      raise TypeError, format(
        ERRORS['type'],
        current_type: attribut.class,
        expected_type: expected_type,
        attr_name: attribut_name
      )
    end
  end
end
