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

	def update
		
		if @feeds.update(feed_params)
			flash[:success] = "Feed updated succesfully"
			redirect_to feed_path(@feeds)
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@feeds.destroy
		flash[:danger] = "Feed deleted succesfully"
		redirect_to feeds_path
	end		
  
  private

   def set_feed
	 	@feeds = Feed.find(params[:id])
   end

	def feed_params
	 	params.require(:feed).permit(:post)
	 end

end

