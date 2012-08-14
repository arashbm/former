class Admin::FilledFormsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :get_filled_forms
  # GET /admin/filled_forms
  # GET /admin/filled_forms.json
  def index
    respond_with :admin, @form, @filled_forms
  end

  # GET /admin/filled_forms/1
  # GET /admin/filled_forms/1.json
  def show
    @filled_form = @filled_forms.find(params[:id])

    respond_with :admin, @form, @filled_form
  end

  # GET /admin/filled_forms/new
  # GET /admin/filled_forms/new.json
  def new
    @filled_form = @filled_forms.create
    redirect_to [:edit, :admin, @form, @filled_form] and return
  end

  # GET /admin/filled_forms/1/edit
  def edit
    @filled_form = @filled_forms.find(params[:id])
  end

  # POST /admin/filled_forms
  # POST /admin/filled_forms.json
  def create
    @filled_form = @filled_forms.new(params[:filled_form], as: :admin)
    @filled_form.save
    respond_with :admin, @form, @filled_form
  end

  # PUT /admin/filled_forms/1
  # PUT /admin/filled_forms/1.json
  def update
    @filled_form = @filled_forms.find(params[:id])

    @filled_form.update_attributes(params[:filled_form], as: :admin)
    respond_with :admin, @form, @filled_form
  end

  # DELETE /admin/filled_forms/1
  # DELETE /admin/filled_forms/1.json
  def destroy
    @filled_form = @filled_forms.find(params[:id])
    @filled_form.destroy

    respond_with :admin, @form, @filled_form
  end
  
  private

  def get_filled_forms
    @form=Form.find(params[:form_id])
    @filled_forms=@form.filled_forms   
  end
end
