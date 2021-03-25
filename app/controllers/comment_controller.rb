class CommentController < ApplicationController

    # Get all comments sorted by date
    def index
        comments = Comment.order('created_at DESC');
        render json: {status: 'Success',message: 'comments obtained',data: comments}
    end

    #create new comment
    def create
        restaurant = Restaurant.find(params[:restaurant_id])
        comment = restaurant.comments.new(comment_params)
     
        if comment.save
            render json: {status: 'Success',message: 'comment created!',data: comment}
        else
            render json: {status: 'Error',message: 'comment not saved',data: comment.errors}
        end
    end

    #verify fields from post request
    private def comment_params
        params.require('comment').permit(:userName,:bodyText)
    end


end
