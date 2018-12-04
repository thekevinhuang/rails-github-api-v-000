class RepositoriesController < ApplicationController

  def index
    new_params = CGI::parse(session[:token])
    binding.pry
    resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.params['access_token'] = new_params["access_token"]
      req.params['scope'] =  ""
      req.params['token_type'] = new_params["token_type"]
    end
    binding.pry
    @info = JSON.parse(resp.body)
  end

end
