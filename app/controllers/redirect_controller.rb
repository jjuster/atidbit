class RedirectController < ApplicationController 
  def home
    redirect_to "https://www.wildvillage.com"
  end

  def index
    short_slug = params[:hex]
    klass = get_class(short_slug[0])
    id = convert_hex_id(short_slug.slice(1, short_slug.length))
    redirect_to "https://www.wildvillage.com/tidbits/#{klass}/#{id}"
  end

  private

  def convert_hex_id(hex)
    hex.to_i(16)
  end

  def get_class(identifier)
    case identifier
    when "f"
      "facts"
    when "j"
      "jokes"
    when "e"
      "explanations"
    when "q"
      "quotes"
    when "h"
      "thoughts"
    when "t"
      "tips"
    else
      nil
    end    
  end
end