module Shopify
  class Tag
    attr_accessor :label
    def initialize(label)
      return unless label.is_a?(String)
      @label = label
    end
  end
end
