class ImageFormsController < ApplicationController
  def index
    @image_forms = ImageForm.all
  end

  def new
    @image_form = ImageForm.new
  end

  def create
    @image_form = ImageForm.new(image_form_params)
    if @image_form.save
      redirect_to @image_form, notice: "Image uploaded successfully!"
    else
      render :new
    end
  end

  def show
    @image_form = ImageForm.find(params[:id])
  end

  private

  def image_form_params
    params.require(:image_form).permit(:title, :description, :image)
  end
end
