class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    resp = Faraday.post("https://github.com/login/oauth/access_token") do |req|
      req.params['client_id'] = ENV['GITHUB_CLIENT_ID']
      req.params['client_secret'] = ENV['GITHUB_CLIENT_SECRET']
      req.params['code'] = params[:code]
      req.headers['Content-Type'] = 'application/json'
    end
    session[:token] = CGI::parse(resp.body)[:access_token]
    binding.pry
    redirect_to root_path
  end
end
