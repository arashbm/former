class Admin::FieldsController < ApplicationController

  # Only an admin can manage fields
  before_filter :authenticate_admin!

  # GET /fields
  # GET /fields.json
  def index
    @fields = Field.all
    respond_with :admin, @fields
  end

  # GET /fields/1
  # GET /fields/1.json
  def show
    @field = Field.find(params[:id])
    respond_with :admin, @field
  end

  # GET /fields/new
  # GET /fields/new.json
  def new
    @field = Field.new
    respond_with :admin, @field
  end

  # GET /fields/1/edit
  def edit
    @field = Field.find(params[:id])
  end

  # POST /fields
  # POST /fields.json
  def create
    @field = Field.create(params[:field])
    respond_with :admin, @field
  end

  # PUT /fields/1
  # PUT /fields/1.json
  def update
    @field = Field.find(params[:id])
    @field.update_attributes(params[:field])
    respond_with :admin, @field
  end

  # DELETE /fields/1
  # DELETE /fields/1.json
  def destroy
    @field = Field.find(params[:id])
    @field.destroy
    respond_with :admin, @field
  end
end
