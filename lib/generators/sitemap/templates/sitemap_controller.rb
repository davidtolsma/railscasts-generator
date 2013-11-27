class SitemapController < ApplicationController
  def show
    @products = [:about, :contact]
  end
end