# encoding: UTF-8
class FilledFormsController < ApplicationController

  # Students can manage their forms
  before_filter :authenticate_student!

  # get filled forms of current student for this form
  before_filter :get_filled_forms

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @filled_forms }
    end
  end

  def show
    @filled_form = @filled_forms.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @filled_form }
    end
  end

  def new
    # redirecting to edit if there is any other incomplete attempts
    if @filled_forms.all? { |f| f.verified? }
      @filled_form = @filled_forms.create!
    else
      @filled_form = @filled_forms.delete_if(&:verified?).last
    end
    redirect_to [:edit, @form, @filled_form] and return
  end

  def edit
    @filled_form = @filled_forms.find(params[:id])
    redirect_to [@form,@filled_form], alert: 'محتوای این نسخه توسط مدیر سیستم تایید شده و قابل تغییر نیست.' if @filled_form.verified?
  end

  def create
    @filled_form = @filled_forms.new(params[:filled_form])

    respond_to do |format|
      if @filled_form.save
        format.html { redirect_to [@form,@filled_form], notice: 'Filled form was successfully created.' }
        format.json { render json: @filled_form, status: :created, location: [@form,@filled_form] }
      else
        format.html { render action: "new" }
        format.json { render json: @filled_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @filled_form = @filled_forms.find(params[:id])

    respond_to do |format|
      if @filled_form.update_attributes(params[:filled_form])
        format.html { redirect_to [@form,@filled_form], notice: 'Filled form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @filled_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @filled_form = @filled_forms.find(params[:id])
    @filled_form.destroy

    respond_to do |format|
      format.html { redirect_to form_filled_forms_url(@form) }
      format.json { head :no_content }
    end
  end

  def get_filled_forms
    @form=Form.find(params[:form_id])
    @filled_forms=current_student.filled_forms.where(form_id: params[:form_id])
  end
end
