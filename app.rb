require 'sinatra'
require_relative 'isbn2.rb'

get '/' do 
	erb :get_isbn
end

post '/isbn' do
    isbn = params[:user_isbn]
    if valid_isbn?(isbn) == true
        erb :get_valid_isbn, :locals => {:isbn => isbn}
    else
        erb :get_invalid_isbn, :locals => {:isbn => isbn}
    end
end