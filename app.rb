# use isbn2.rb
require 'sinatra'
require_relative'isbn2.rb'

get'/' do
	erb :get_isbn
end


post '/isbn' do
	isbn = params[:isbn => isbn]
	if valid_isbn?(isbn) == true
		erb :get_valid_isbn, :locals =>{:isbn => isbn}
	else
		hello World
	end
end