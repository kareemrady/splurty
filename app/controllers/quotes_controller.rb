class QuotesController < ApplicationController
	def index
		@quote = Quote.order("RANDOM()").first
		#author_initials
		
	end

	def create
		@quote = Quote.create(quote_params)
		if @quote.invalid?
			flash[:error] =  '<strong>Couldn\'t not save</strong> data is invalid'
		end
		redirect_to root_path
	end

	def about
	end

	def show
		@quote = Quote.find(params[:id])
		author_initials
	end

	private

	def quote_params
		params.require(:quote).permit(:saying, :author)
	end

	# private 
	# def author_initials
	# 	@initials = ""
	# 	@quote.author.split(" ").each {|name| @initials += name[0].capitalize}
	# 	@initials
 # 	end
end
