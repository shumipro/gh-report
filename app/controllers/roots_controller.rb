class RootsController < ApplicationController
  include SessionsHelper
  before_action :redirect_to_reports, only: [:index]

  def index
  end

  private
  def redirect_to_reports
    redirect_to reports_url if logged_in?
  end
end
