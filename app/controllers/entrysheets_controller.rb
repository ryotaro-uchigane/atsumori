class EntrysheetsController < ApplicationController
  before_action :logged_in_user, only: [:show, :new, :create, :edit, :update, :destroy]

  def new
    @entrysheet = Entrysheet.new()
  end

  def edit
    @entrysheet = Entrysheet.find(params[:id])
  end

  def create
    @entrysheet = Entrysheet.new(entrysheet_params)
    @entrysheet.user_id = session[:user_id]
    if @entrysheet.save
      redirect_to action: :show, id: @entrysheet.id
    else
      render action: :new
    end
  end

  def show
    @entrysheet = Entrysheet.find(params[:id])
  end

  def update
    @entrysheet = Entrysheet.find(params[:id])
    if @entrysheet.update(entrysheet_params)
      redirect_to @entrysheet, notice: "エントリーシートを更新しました。"
    else
      render action: :edit
    end
  end

  def destroy
    @entrysheet = Entrysheet.find(params[:id])
    @entrysheet.destroy
    redirect_to @entrysheet, notice: "エントリーシートを削除しました。"
  end

  private
  def entrysheet_params
    params.require(:entrysheet).permit(
      :name, :age, :sex
    )
  end

end
