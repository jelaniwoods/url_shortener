class Api::V1::UrlsController < Api::V1::GraphitiController
  def index
    urls = UrlResource.all(params)
    respond_with(urls)
  end

  def show
    url = UrlResource.find(params)
    respond_with(url)
  end

  def create
    url = UrlResource.build(params)

    if url.save
      render jsonapi: url, status: :created
    else
      render jsonapi_errors: url
    end
  end

  def update
    url = UrlResource.find(params)

    if url.update_attributes
      render jsonapi: url
    else
      render jsonapi_errors: url
    end
  end

  def destroy
    url = UrlResource.find(params)

    if url.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: url
    end
  end
end
