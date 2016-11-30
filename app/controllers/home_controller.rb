class HomeController < ApplicationController
  def show
    render_component say_hello_to: params[:say_hello_to]
  end
end
