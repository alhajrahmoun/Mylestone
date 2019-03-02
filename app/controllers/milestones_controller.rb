class MilestonesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]

  # GET /milestones
  def index
    @milestones = Milestone.all.includes(:user).order(date: :DESC)
  end

  # GET /milestones/1
  def show
  end

  # GET /milestones/new
  def new
    @milestone = current_user.milestones.new
  end

  # GET /milestones/1/edit
  def edit
  end

  # POST /milestones
  def create
    @milestone = current_user.milestones.new(milestone_params)

    if @milestone.save
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /milestones/1
  def update
    if @milestone.update(milestone_params)
      redirect_to @milestone, notice: 'Milestone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /milestones/1
  def destroy
    @milestone.destroy
    redirect_to milestones_url, notice: 'Milestone was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def milestone_params
      params.require(:milestone).permit(:title, :story, :date)
    end
end
