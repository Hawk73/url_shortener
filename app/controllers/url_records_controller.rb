class UrlRecordsController < ApplicationController
  def create
    url = UrlRecord.create!(original_url: params[:url], uuid: SecureRandom.uuid)
    render json: url_record_url(url.uuid)
  end

  def show
    url = UrlRecord.find_by!(uuid: params[:id])
    url.increment!(:counter)
    render json: url.original_url
  end

  def stats
    render json: UrlRecord.find_by!(uuid: params[:id]).counter
  end
end
