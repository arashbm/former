# encoding: UTF-8
class FilledFormsController < ApplicationController

  # Students can manage their forms
  before_filter :authenticate_student!

  # get filled forms of current student for this form
  before_filter :get_filled_forms

  def index
    respond_with @form, @filled_forms
  end

  def show
    @filled_form = @filled_forms.find(params[:id])
    respond_with @form, @filled_form
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
    @filled_form = @filled_forms.create(params[:filled_form])
    respond_with @form, @filled_form
  end

  def update
    @filled_form = @filled_forms.find(params[:id])
    @filled_form.update_attributes(params[:filled_form])
    respond_with @form, @filled_form
  end

  def destroy
    @filled_form = @filled_forms.find(params[:id])
    @filled_form.destroy
    respond_with @form, @filled_form
  end

  private

  def get_filled_forms
    @form=Form.find(params[:form_id])
    @filled_forms=current_student.filled_forms.where(form_id: params[:form_id])
  end
end
