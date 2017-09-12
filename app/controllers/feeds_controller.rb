class FeedsController < ApplicationController
  before_action :set_feed , only: [:edit,:update,:show,:destroy]

	def index
		@feeds = Feed.all
	end

	def new
		@feeds = Feed.new
	end

	def create
		 @feeds = Feed.new(feed_params)
		 if @feeds.save
		 	flash[:success] = "Feed was succesfully created	"
		 	redirect_to feed_path(@feeds)
		 else
		 	render 'new'
		 end
	end

	def show
	end
  
  private

   def set_feed
	 	@feeds = Feed.find(params[:id])
   end

	def feed_params
	 	params.require(:feed).permit(:post)
	 end

end

