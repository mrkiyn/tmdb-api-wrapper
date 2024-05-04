class Tmdb::V1::TmdbController < ApplicationController
    before_action :initialize_client

    def show_details
        @info = @client.show_details(show_type: params[:show_type], show_id: params[:show_id])
        render json: @info
    end


    def search_show
        @show = @client.search_show(show_type: params[:show_type], query: params[:query])
        render json: @show
    end

    def popular_show
        @show = @client.popular_show(show_type: params[:show_type])
        render json: @show
    end

    def show_reviews
        @reviews = @client.show_reviews(show_type: params[:show_type], show_id: params[:show_id])
        render json: @reviews
    end

    def similar_show
        @shows = @client.similar_show(show_type: params[:show_type], show_id: params[:show_id])
        render json: @shows
    end

    def top_rated_show
        @shows = @client.top_rated_show(show_type: params[:show_type])
        render json: @shows
    end

    private

    def initialize_client
        @client = Tmdb::V1::Client.new
    end
end
