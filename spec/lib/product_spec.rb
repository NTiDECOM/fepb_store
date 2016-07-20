require "spec_helper"
require "product"

describe Product do
  it "has a title" do
    product = Product.new
    product.title.should_not == nil
  end

end
