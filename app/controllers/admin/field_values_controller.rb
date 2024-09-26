# frozen_string_literal: true

module Admin
  class FieldValuesController < ApplicationController
    before_action :set_field_template
    before_action :set_field_value, only: %i(show edit update destroy)

    def index
      @field_values = @field_template.field_values
      respond_to do |format|
        format.html
      end
      render layout: 'admin'
    end

    def show
      render layout: 'admin'
    end

    def new
      @field_value = @field_template.field_values.new
      render layout: 'admin'
    end

    def edit
      render layout: 'admin'
    end

    def create
      @field_value = @field_template.field_values.new(field_value_params)
      if @field_value.save
        redirect_to [:admin, @field_template, @field_value], notice: 'Field Value was successfully created.'
      else
        respond_to do |format|
          format.html { render :new, layout: 'admin' }
        end
      end
    end

    def update
      if @field_value.update(field_value_params)
        respond_to do |format|
          format.html { redirect_to [:admin, @field_template, @field_value], notice: 'Field Value was successfully updated.' }
        end
      else
        respond_to do |format|
          format.html { render :edit, layout: 'admin' }
        end
      end
    end

    def destroy
      @field_value.destroy
      respond_to do |format|
        format.html { redirect_to admin_field_template_field_values_path(@field_template), notice: 'Field Value was successfully destroyed.' }
      end
    end

    private

    def set_field_template
      @field_template = FieldTemplate.find(params[:field_template_id])
    end

    def set_field_value
      @field_value = @field_template.field_values.find(params[:id])
    end

    def field_value_params
      params.require(:field_value).permit(:value, :display_value, :description, :default, :order)
    end
  end
end
