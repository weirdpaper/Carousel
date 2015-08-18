class CarouselController < ApplicationController

  before_filter :set_cache_buster
  before_filter :authenticated    #from ApplicationController.rb

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"]        = "no-cache"
    response.headers["Expires"]       = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

end
