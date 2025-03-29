class DashboardsController < ApplicationController
  def show
    render Views::Dashboards::Show.new
  end
end
