class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @company = Company.first
    unless @company.blank?
      redirect_to @company
    else
      redirect_to new_company_path
    end
  end

  def show; end

  def new
    @company = Company.new
  end

  def edit; end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = t('flash_message.controllers.companies.save.success')
      redirect_to companies_path
    else
      flash[:error] = t('flash_message.controllers.companies.save.error')
      render :new
    end
  end

  def update
    if @company.update(company_params)
      flash[:success] = t('flash_message.controllers.companies.update.success')
      redirect_to companies_path
    else
      flash[:error] = t('flash_message.controllers.companies.update.error')
      render :edit
    end
  end
  
  def destroy
    @company.destroy
    flash[:success] = t('flash_message.controllers.companies.destroy.success')
  end

  private
  def company_params
    params.require(:company).permit(:name, :website, :logo)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end