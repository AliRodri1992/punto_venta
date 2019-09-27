class CompaniesController < ApplicationController
  def index
    @company = Company.first
  end
end