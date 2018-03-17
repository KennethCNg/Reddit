class SubsController < ApplicationController
    
    def new
        sub = Sub.new
    end

    def create
        sub = Sub.new(sub_params)
        if sub.save
            redirect_to subs_url
        else
            render json: sub.errors.full_messages, status: 422
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
        sub = Sub.find(params[:id])
        if sub.update(sub_params)
            redirect_to sub
        else
            flash.now[:errors] = subs.errors.full_messages, status: 422
            render :edit
        end

    end

    def destroy
        sub = Sub.find(params[:id])
        if sub.destroy
            redirect_to subs_url
        else
            flash.now[:errors] = subs.errors.full_messages, status: 422
            render :index
        end
    end

    def edit
        sub = Sub.find(params[:id])
    end

    private
    
    def sub_params
        params.require(:subs).permit(:name, :moderator_id, :description)
    end

end
