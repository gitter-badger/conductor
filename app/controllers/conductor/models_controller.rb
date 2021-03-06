require 'rails/generators'

module Conductor
  class ModelsController < ApplicationController
    def new
    end

    def create
      @form = ModelGeneratorForm.new(params[:model])

      if @form.valid?
        Rails.logger.info @form.command_line
        @form.run
        flash[:success] = "The model was created!"
      else
        flash[:error] = "Cannot create the model! Please verify the information"
      end

      redirect_to(new_model_url)
    end
  end
end
