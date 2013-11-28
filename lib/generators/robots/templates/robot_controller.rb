class RobotController < ApplicationController
  def show
    render 'robot/robots.text.erb'
  end
end