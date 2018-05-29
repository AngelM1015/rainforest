class MenController < ApplicationController

    def index
          @mens_shoes = Product.where(:category => "menfootwear")
          @mens_shirts = Product.where(:category => "menshirts")
          @mens_pants = Product.where(:category => "menpants")
    end
end
