# This is the errors Controller for displaying the invalid routes    
class ErrorsController < ApplicationController
  def routing
    render :json => {:error => "not-found"}.to_json, :status => 404
  end
end