class ColumnsController < ApplicationController

  #SETTING BOARD BEFORE CODE
  before_action :set_board, only: [:index,:create,:move]
  before_action :set_column, only: [:show, :update, :destroy]  

#BEGIN------------------CREATE OPERATION-----------------------------

  # POST /boards/:board_id/columns
  def create
    @column = @board.columns.new(column_params)
    if @column.save
      render json: @column, status: :created
    else
      render json: @column.errors, status: :unprocessable_entity
    end   
  end  
  

#END--------------------CREATE OPERATION-----------------------------

#BEGIN-------------------READ OPERATION------------------------------

  # GET /boards/:board_id/columns 
  def index
    @columns = @board.columns
    render json: @columns
  end

  # GET /boards/:board_id/columns/:id
  def show
    render json: @column
  end
  
#END-------------------READ OPERATION----------------------------------

#Begin-----------------UPDATE OPERATION--------------------------------
   
  # PATCH/PUT /boards/:board_id/columns/:id
  def update
    if @column.update(column_params)
      render json: @column
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end
  # PATCH /boards/:board_id/columns/:id/move
  def move
    @column = @board.columns.find(params[:id])
    @column.insert_at(params[:new_position].to_i)
    render json: @column
  end
  
#END-------------------UPDATE OPERATION-------------------------------

#Begin-----------------DELETE OPERATION--------------------------------

  # DELETE /boards/:board_id/columns/:id
  def destroy
   @column.destroy
  end

#END-------------------DELETE OPERATION-------------------------------

#Begin-----------------Methods Definition--------------------------------

private
  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_column
    @column = Column.find(params[:id])
  end

  def column_params
    params.require(:column).permit(:name,:position)
  end

#END-----------------Methods Definition--------------------------------

end
