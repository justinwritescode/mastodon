# frozen_string_literal: true

module Admin
  class FaqsController < ApplicationController
    before_action :set_faq, only: [:show, :edit, :update, :destroy]
    before_action :authorize_faq, only: [:create, :update, :destroy] # Add authorization filter

    def index
      @faqs = Faq.ordered
      @faq = Faq.new
      render layout: 'admin' # This would override the default layout for this action only
    end

    def show; end

    def new
      @faq = Faq.new
      authorize @faq
      render layout: 'admin' # This would override the default layout for this action only
    end

    def edit
      render layout: 'admin'
    end

    def create
      @faq = Faq.new(faq_params)
      authorize @faq
      if @faq.save
        redirect_to admin_faqs_path, notice: 'FAQ was successfully created.'
      else
        render :new, layout: 'admin'
      end
    end

    def update
      authorize @faq
      if @faq.update(faq_params)
        redirect_to admin_faqs_path, notice: 'FAQ was successfully updated.'
      else
        render :edit, layout: 'admin'
      end
    end

    def destroy
      authorize @faq
      @faq.destroy
      redirect_to admin_faqs_path, notice: 'FAQ was successfully destroyed.'
    end

    private

    def authorize_faq
      authorize @faq unless @faq.nil?
    end

    def set_faq
      @faq = Faq.find(params[:id])
    end

    def faq_params
      params.require(:faq).permit(:question, :answer)
    end
  end
end
