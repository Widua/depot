class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def index
    @products = Product.where(locale: I18n.locale.to_s).order(:title)
    session[:store_index_counter] ||= 0
    @counter = session[:store_index_counter] += 1
  end
end
