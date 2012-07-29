class Admin::FormsController < ApplicationController

  # Only admins can manage forms
  before_filter :authenticate_admin!

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
    respond_with :admin, @forms
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find(params[:id])
    respond_with :admin, @form
  end

  # GET /forms/new
  # GET /forms/new.json
  def new
    @form = Form.new
    @form.enabled=true
    respond_with :admin, @form
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.create(params[:form])
    respond_with :admin, @form
  end

  # PUT /forms/1
  # PUT /forms/1.json
  def update
    @form = Form.find(params[:id])
    @form.update_attributes(params[:form])
    respond_with :admin, @form
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    respond_with :admin, @form
  end
end
