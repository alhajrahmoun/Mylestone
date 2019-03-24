module Api
  class MilestonesController < ApiController
    before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
    before_action :set_milestone, only: [:edit, :update, :destroy]

    # GET /milestones
    def index
      if params['filter'].eql?('personal') && user_signed_in?
        @milestones = current_user.milestones.includes(:user).order(date: :DESC)
      else
        @milestones = Milestone.all.includes(:user).order(date: :DESC)
      end
    end

    def create
      @milestone = current_user.milestones.new(milestone_params)

      if @milestone.save
        render json: {message: "Your milestone created successfully."}
      else
        render json: {message: "something went wrong, please check your input"}
      end
    end

    # DELETE /milestones/1
    def destroy
      @milestone.destroy
      render json: {message: "Your milestone deleted successfully"}
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
end