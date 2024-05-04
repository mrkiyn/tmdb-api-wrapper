class Tmdb::V1::Client   
  BASE_URL = 'https://api.themoviedb.org/3'
  ACCESS_TOKEN = "Bearer #{ENV['ACCESS_TOKEN_AUTH']}"

  def show_details(show_type:, show_id:, **params)
    request(
      method: :get,
      endpoint: "#{show_type}/#{show_id}",
      params: params,
      headers: { 'Authorization' => ACCESS_TOKEN }
    )
  end

  def search_show(show_type:, **params)
    request(
      method: :get,
      endpoint: "search/#{show_type}",
      params: params,
      headers: { 'Authorization' => ACCESS_TOKEN }
    )
  end

  def popular_show(show_type:, **params)
    request(
      method: :get,
      endpoint: "#{show_type}/popular",
      params: params,
      headers: { 'Authorization' => ACCESS_TOKEN }
    )
  end

  

  def show_reviews(show_type:, show_id:, **params)
    request(
      method: :get,
      endpoint: "#{show_type}/#{show_id}/reviews",
      params: params,
      headers: { 'Authorization' => ACCESS_TOKEN }
    )
  end

  def similar_show(show_type:, show_id:, **params)
    request(
      method: :get,
      endpoint: "#{show_type}/#{show_id}/similar",
      params: params,
      headers: { 'Authorization' => ACCESS_TOKEN }
    )
  end

  def top_rated_show(show_type:, **params)
    request(
      method: :get,
      endpoint: "#{show_type}/top_rated",
      params: params,
      headers: { 'Authorization' => ACCESS_TOKEN }
    )
  end

  private

  def request(method:, endpoint:, params: {}, headers: {}, body: {}) 
    response = connection.public_send(method, endpoint) do |request|
      request.params = params
      request.headers['Authorization'] = headers['Authorization']
      request.body = body.to_json if body.present?
    end

    if response.success?
      JSON.parse(response.body).with_indifferent_access
    else
      raise "Error: #{response.status}"
    end
  end

  def connection
    Faraday.new(url: BASE_URL)
  end
end
