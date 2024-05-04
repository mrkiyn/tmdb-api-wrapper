Rails.application.routes.draw do
  namespace :tmdb do
    namespace :v1 do
      #----------------FOR MOVIES----------------
      

      


      #----------------DYNAMIC----------------
      get 'tmdb/show_details', to: 'tmdb#show_details'
      get 'tmdb/search_show', to: 'tmdb#search_show'
      get 'tmdb/popular_show', to: 'tmdb#popular_show'
      get 'tmdb/show_reviews', to: 'tmdb#show_reviews'
      get 'tmdb/similar_show', to: 'tmdb#similar_show'
      get 'tmdb/top_rated_show', to: 'tmdb#top_rated_show' 
    end
  end
end