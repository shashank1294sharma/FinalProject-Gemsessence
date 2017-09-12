class FeedsController < ApplicationController
  before_action :set_feed , only: [:edit,:update,:show,:destroy]

	def index
		@feeds = current_user.feeds
	end

	def new
		@feed = Feed.new
	end

	def create
		 @feed = current_user.feeds.build(feed_params)
		 if @feed.save
		 	flash[:success] = "Feed was succesfully created	"
		 	redirect_to feed_path(@feed)
		 else
		 	render 'new'
		 end
	end

	def update
		
		if @feed.update(feed_params)
			flash[:success] = "Feed updated succesfully"
			redirect_to feed_path(@feed)
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@feed.destroy
		flash[:danger] = "Feed deleted succesfully"
		redirect_to feeds_path
	end		
  
  private

   def set_feed
	 	@feed = Feed.find(params[:id])
   end

	def feed_params
	 	params.require(:feed).permit(:post)
	 end

end

