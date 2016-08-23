class SupportersController < ApplicationController

  SUPPORTERS_PER_PAGE = 7

  def index
    if params[:search]
      @supporters = Supporter.search(params[:search]).order(created_at: :desc).
                                    page(params[:page]).
                                    per(SUPPORTERS_PER_PAGE)
    else
      @supporters = Supporter.order(created_at: :desc).
                                    page(params[:page]).
                                    per(SUPPORTERS_PER_PAGE)
    end
  end

  def new
    @supporter = Supporter.new
  end

  def create
    @supporter = Supporter.new supporter_params
    if @supporter.save
      redirect_to supporter_path(@supporter), notice: "Supporter added successfully"
    else
      flash[:alert] = "Please fix the errors below before saving"
      render :new
    end

  end

  def edit
    @supporter=Supporter.find params[:id]
  end

  def update
    @supporter=Supporter.find params[:id]
    if @supporter.update params.require(:supporter).permit([:title, :body, :email, :dept])
      redirect_to supporter_path(@supporter)
    else
      render :edit
    end
  end


  def supporter_params
    params.require(:supporter).permit([:title, :body, :dept, :email])
  end

  def show
    @supporter = Supporter.find params[:id]
  end

  def destroy
    supporter=Supporter.find params[:id]
    supporter.destroy
    redirect_to supporters_path
  end


end
