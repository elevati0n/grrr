class MetaController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_metum, only: [:show, :edit, :update, :destroy, :vote]

  # GET /meta
  # GET /meta.json
  def index
    @meta = Metum.all
  end

  # GET /meta/1
  # GET /meta/1.json
  def show
  end

  # GET /meta/new
  def new
    @metum = Metum.new
  end

  # GET /meta/1/edit
  def edit
  end

  # POST /meta
  # POST /meta.json
  def create
    @metum = Metum.new(metum_params)
    @meta.user = current_user

    respond_to do |format|
      if @metum.save
        format.html { redirect_to @metum, notice: 'Metum was successfully created.' }
        format.json { render :show, status: :created, location: @metum }
      else
        format.html { render :new }
        format.json { render json: @metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meta/1
  # PATCH/PUT /meta/1.json
  def update
    respond_to do |format|
      if @metum.update(metum_params)
        format.html { redirect_to @metum, notice: 'Metum was successfully updated.' }
        format.json { render :show, status: :ok, location: @metum }
      else
        format.html { render :edit }
        format.json { render json: @metum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meta/1
  # DELETE /meta/1.json
  def destroy
    @metum.destroy
    respond_to do |format|
      format.html { redirect_to meta_url, notice: 'Metum was successfully destroyed.' }
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

    @meta.vote_by voter: current_user, vote: direction

    redirect_to action: :index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metum
      @metum = Metum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metum_params
      params.require(:metum).permit(:content_id, :data, :user_id, :approval_id, :post_id, :feed_id, :presenter_id, :friendship_id)
    end
end
