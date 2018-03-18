class SubsController < ApplicationController
    before_action :verify_moderator, only: [:edit, :update, :destroy]
    
    def new
        sub = Sub.new
    end

    def create
        @sub = current_user.subs.new(sub_params)
        if @sub.save
            redirect_to subs_url(@sub)
        else
            render json: @sub.errors.full_messages, status: 422
        end
    end

    def show
        sub = Sub.find(params[:id])
    end

    def index
        subs = Sub.all
        render :index
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            # why is this sub
            redirect_to subs_url(@sub)
        else
            flash.now[:errors] = subs.errors.full_messages
            render :edit
        end

    end

    def destroy
        sub = Sub.find(params[:id])
        if sub.destroy
            redirect_to subs_url
        else
            flash.now[:errors] = sub.errors.full_messages
            render :index
        end
    end

    def edit
        sub = Sub.find(params[:id])
    end

    private
    
    def sub_params
        params.require(:sub).permit(:name, :description)
    end

    def verify_moderator
        if current_user.subs.find(params[:id])
        # do nothing
        else
            render json: 'Forbidden', status: :forbidden
        end
    end

end
