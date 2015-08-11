class StoriesController < ApplicationController
  before_action :logged_member, only: [:new, :create]

  def new
	@story = Story.new
  end

  def create
	@story = Story.new(body: params[:story][:body], member_id: current_member.id)
	if @story.save
	  flash.now[:success] = "Story posted successfully"
	  redirect_to root_url
	else
	  render :new
	end
  end

  def index
	@stories = Story.paginate(page: params[:page]).order(created_at: :desc)
  end

  private
	def logged_member
	  unless logged_in?
		flash.now[:info] = "Please log in"
		redirect_to login_path
	  end
	end
end
