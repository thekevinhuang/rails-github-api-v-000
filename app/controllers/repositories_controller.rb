class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.params['access_token'] = session[:token]
    end
    binding.pry
    @info = JSON.parse(resp.body)
  end

end
