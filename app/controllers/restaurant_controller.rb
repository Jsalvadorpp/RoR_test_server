class RestaurantController < ApplicationController

     # Get all restaurants sorted by date
     def index
        restaurants = Restaurant.order('created_at DESC');
        render json: {status: 'Success',message: 'restaurants obtained',data: restaurants}
    end

    #create new restaurant
    def create
        restaurant = Restaurant.new(restaurant_params)
        #hard coded images gallery
        restaurant.gallery = [
            "https://raw.githubusercontent.com/Jsalvadorpp/RoR_Test/main/client/public/images/gallery1.jpg",
            "https://raw.githubusercontent.com/Jsalvadorpp/RoR_Test/main/client/public/images/gallery2.jpg",
            "https://raw.githubusercontent.com/Jsalvadorpp/RoR_Test/main/client/public/images/gallery3.jpg",
            "https://raw.githubusercontent.com/Jsalvadorpp/RoR_Test/main/client/public/images/gallery4.jpg",
        ]

        if restaurant.save
            render json: {status: 'Success',message: 'restaurant created',data: restaurant}
        else
            render json: {status: 'Error',message: 'restaurant not saved',data: restaurant.errors}
        end
    end


    #get one restaurant info 
    def show
        restaurant = Restaurant.find(params[:id])
        comments = restaurant.comments

        render json: {status: 'Success',message: 'restaurant obtained',data: {restaurant: restaurant, comments: comments}}
     
    end

    #verify fields from post request
    private def restaurant_params
        params.require('restaurant').permit(:name,:description,:logoUrl)
    end


end
