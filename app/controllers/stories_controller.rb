class StoriesController < ApplicationController
  
  # SETTING COLUMN BEFORE CODE
  before_action :set_column, only: [:index, :create,:move]
  before_action :set_story, only: [:show, :update, :destroy]

#BEGIN------------------CREATE OPERATION-----------------------------

  # POST /boards/:board_id/columns/:column_id/stories
  def create
    @story = @column.stories.new(story_params)
    if @story.save
      render json: @story, status: :created
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

#END--------------------CREATE OPERATION-----------------------------

#BEGIN-------------------READ OPERATION------------------------------

  # GET /columns/:column_id/stories
  def index
    @stories = @column.stories
    render json: @stories
  end

  # GET /columns/:column_id/stories/:id
  def show
    render json: @story
  end  
  
#END-------------------READ OPERATION----------------------------------

#Begin-----------------UPDATE OPERATION--------------------------------
   
  # PATCH/PUT /columns/:column_id/stories/:id
  def update
    if @story.update(story_params)
    render json: @story
    else
    render json: @story.errors, status: :unprocessable_entity
    end
  end

  # PATCH /boards/:board_id/columns/:id/stories/:id/move
  def move
    @story = @column.stories.find(params[:id])
    @story.insert_at(params[:new_position].to_i)
    render json: @story
  end
#END-------------------UPDATE OPERATION-------------------------------

#Begin-----------------DELETE OPERATION--------------------------------

  # DELETE /columns/:column_id/stories/:id
  def destroy
    @story.destroy
  end

#END-------------------DELETE OPERATION-------------------------------

#Begin-----------------Methods Definition--------------------------------
  private

  def set_column
    @column = Column.find(params[:column_id])
  end

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:name,:position, :description, :status, :due_date)
  end

#END-----------------Methods Definition--------------------------------

end
