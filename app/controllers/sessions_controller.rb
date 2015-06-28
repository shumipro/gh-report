class SessionsController < ApplicationController
  def create
    @user = User.find_by(uid: auth_hash['uid'])
    unless @user
      @user = User.create(
        uid:      auth_hash['uid'],
        nickname: auth_hash['info']['nickname'],
        email:    auth_hash['info']['email'],
        name:     auth_hash['info']['name'],
        image:    auth_hash['info']['image'],
        token:    auth_hash['credentials']['token']
      )
    end
    log_in(@user)
    redirect_to reports_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end

