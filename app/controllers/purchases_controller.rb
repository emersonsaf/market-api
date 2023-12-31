class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :update, :destroy]

  def index
    purchases = Purchase.includes(:purchase_items).all
    render json: purchases.to_json(include: { purchase_items: { only: [:id, :product_id, :amount, :value] } })
  end

  def show
    purchase = Purchase.includes(:purchase_items).find(params[:id])
    render json: purchase.to_json(include: { purchase_items: { only: [:id, :product_id, :amount, :value] } })
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      render json: @purchase, status: :created
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end  

  def update
    @purchase = Purchase.find(params[:id])
    @purchase.purchase_items.destroy_all

    if @purchase.update(purchase_params)
      render json: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.purchase_items.destroy_all
    @purchase.destroy
    head :no_content
  end

  def months_with_purchases
    montlyBuyerListing = Purchase.montly_buyer_listing
    render json: { data: montlyBuyerListing }
  end
  
  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:client_id, :proof_document, :total_value, purchase_items_attributes: [:product_id, :amount, :value])
  end
  
end
