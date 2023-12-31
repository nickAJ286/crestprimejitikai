class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @events = Event.all
    @approvals = Approval.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @approvals = @event.approvals
    @pre_comments = @event.pre_comments.includes(:user)
    @pre_comment = PreComment.new
    @participation = @event.participations
    @before_comments = @event.before_comments.includes(:user)
    @before_comment = BeforeComment.new
    @after_comments = @event.after_comments.includes(:user)
    @after_comment = AfterComment.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id)
    else
      render :edit
    end
  end
  private

  def event_params
    params.require(:event).permit(:name, :catch_copy, :explanation, :event_date, :event_time, :place, :capacity, :price,
      :image).merge(user_id: current_user.id)
  end
end
