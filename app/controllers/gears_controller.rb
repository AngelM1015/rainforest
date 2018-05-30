class GearsController < ApplicationController
      def index
          @gear = Product.where(:category => "camping-gear")
      end
end
