class NoticesController < ApplicationController
    before_action :set_params, only: [:show, :update, :destroy]
    def index
        @notice = Notice.all
    end

    def create
        authorize @notice
        @users = User.where(role: 0)
        @notice = Notice.new(notice_params)
        if @notice.save
            
            NoticeMailer.new_notice(@notice).deliver_now
            NoticeMailer.new_notice(@notice, @users).deliver_now
            render json: @notice
        else 
            render json: error.full_messages
        end
    end

    def show
        render json: @notice    
    end

    def update
        authorize @notice
        @notice = Notice.update(notice_params)
        render json: @notice
    end
    
    def destroy
        @notice.destroy
        render json: @notices
    end

    private

    def notice_params
        params.require(:notice).permit(:title, :description)
    end
     
    def set_params
        @notice = Notice.find(params[:id])
    end
end