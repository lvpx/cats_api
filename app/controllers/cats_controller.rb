class CatsController < ApplicationController
  before_action :set_cat, only: %i[show edit update destroy]

  def index
    cats = Cat.all
    render json: {
      cats:,
      links: [
        { rel: 'self', href: cats_url, method: 'GET' },
        { rel: 'create', href: cats_url, method: 'POST' }
      ]
    }
  end

  def create
    cat = Cat.new(cat_params)
    if cat.save
      render json: {
        cat:,
        links: [
          { rel: 'self', href: cat_url(cat), method: 'GET' },
          { rel: 'update', href: cat_url(cat), method: 'PUT' },
          { rel: 'delete', href: cat_url(cat), method: 'DELETE' }
        ]
      }, status: :created
    else
      render json: cat.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: {
      cat: @cat,
      links: [
        { rel: 'self', href: cat_url(@cat), method: 'GET' },
        { rel: 'update', href: cat_url(@cat), method: 'PUT' },
        { rel: 'delete', href: cat_url(@cat), method: 'DELETE' }
      ]
    }
  end

  def update
    if @cat.update(cat_params)
      render json: {
        cat: @cat,
        links: [
          { rel: 'self', href: cat_url(@cat), method: 'GET' },
          { rel: 'update', href: cat_url(@cat), method: 'PUT' },
          { rel: 'delete', href: cat_url(@cat), method: 'DELETE' }
        ]
      }
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cat.destroy
    head :no_content
  end

  private

  def cat_params
    params.permit(:image)
  end

  def set_cat
    @cat = Cat.find(params[:id])
  end
end
