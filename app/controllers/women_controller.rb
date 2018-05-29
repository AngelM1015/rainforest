class WomenController < ApplicationController
  def index
        @womens_shoes = Product.where(:category => "womenfootwear")
        @womens_shirts = Product.where(:category => "womenshirts")
        @womens_pants = Product.where(:category => "womenpants")
  end
end
