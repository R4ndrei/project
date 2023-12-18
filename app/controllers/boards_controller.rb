class BoardsController < ApplicationController

#BEGIN------------------CREATE OPERATION-----------------------------
 
  #POST /boards
  def create
    @board = Board.new(board_params)
    if @board.save
      render json: @board, status: :created, location: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end   
  end  
#END--------------------CREATE OPERATION-----------------------------

#BEGIN-------------------READ OPERATION------------------------------

  def index
    @boards = Board.all
    render json: @boards
  end  

  # GET /boards/:id
  def show
    @board = Board.find(params[:id])
    render json: @board
  end  

#END-------------------READ OPERATION----------------------------------

#Begin-----------------UPDATE OPERATION--------------------------------

  #PATCH/PUT /boards/:id
  def update
    @board= Board.find(params[:id])
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end  
  end  

#END-------------------UPDATE OPERATION-------------------------------

#Begin-----------------DELETE OPERATION--------------------------------

#DELETE /boards/:id
  def destroy
    @board= Board.find(params[:id])
    @board.destroy
  end  

#END-------------------DELETE OPERATION-------------------------------
  private
    def board_params
        params.require(:board).permit(:name)
    end

end