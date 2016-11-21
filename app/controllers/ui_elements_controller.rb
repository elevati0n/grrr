class UiElementsController < ApplicationController
  before_action :set_ui_element, only: [:show, :edit, :update, :destroy]

  # GET /ui_elements
  # GET /ui_elements.json
  def index
    @ui_elements = UiElement.all
  end

  # GET /ui_elements/1
  # GET /ui_elements/1.json
  def show
  end

  # GET /ui_elements/new
  def new
    @ui_element = UiElement.new
  end

  # GET /ui_elements/1/edit
  def edit
  end

  # POST /ui_elements
  # POST /ui_elements.json
  def create
    @ui_element = UiElement.new(ui_element_params)

    respond_to do |format|
      if @ui_element.save
        format.html { redirect_to @ui_element, notice: 'Ui element was successfully created.' }
        format.json { render :show, status: :created, location: @ui_element }
      else
        format.html { render :new }
        format.json { render json: @ui_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ui_elements/1
  # PATCH/PUT /ui_elements/1.json
  def update
    respond_to do |format|
      if @ui_element.update(ui_element_params)
        format.html { redirect_to @ui_element, notice: 'Ui element was successfully updated.' }
        format.json { render :show, status: :ok, location: @ui_element }
      else
        format.html { render :edit }
        format.json { render json: @ui_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ui_elements/1
  # DELETE /ui_elements/1.json
  def destroy
    @ui_element.destroy
    respond_to do |format|
      format.html { redirect_to ui_elements_url, notice: 'Ui element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @ui_element.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ui_element
      @ui_element = UiElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ui_element_params
      params.require(:ui_element).permit(:meta, :user_id, :presenter_id, :content_id)
    end
end
