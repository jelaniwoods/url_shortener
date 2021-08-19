class UrlsController < ApplicationController
  before_action :current_user_must_be_url_user,
                only: %i[edit update destroy]

  before_action :set_url, only: %i[show edit update destroy]

  def index
    @q = Url.ransack(params[:q])
    @urls = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @url = Url.new
  end

  def edit; end

  def create
    @url = Url.new(url_params)

    if @url.save
      message = "Url was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @url, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @url.update(url_params)
      redirect_to @url, notice: "Url was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @url.destroy
    message = "Url was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to urls_url, notice: message
    end
  end

  private

  def current_user_must_be_url_user
    set_url
    unless current_user == @url.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:url, :user_id)
  end
end
