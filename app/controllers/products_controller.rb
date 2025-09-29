class ProductsController < ApplicationController
  before_action :authorize_request, # only: [ :create ]

  def index
    products = Product.all

    render json: products
  end

  def create
    product = Product.new(
      name: params[:name],
      description: params[:description]
    )

    if product.save
      render json: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end
end
