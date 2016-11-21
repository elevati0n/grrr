class ApprovalsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_approval, only: [:show, :edit, :update, :destroy]

  # GET /approvals
  # GET /approvals.json
  def index
    @approvals = Approval.all
  end

  # GET /approvals/1
  # GET /approvals/1.json
  def show
  end

  # GET /approvals/new
  def new
    @approval = Approval.new
  end

  # GET /approvals/1/edit
  def edit
  end

  # POST /approvals
  # POST /approvals.json
  def create
    @approval = Approval.new(approval_params)
    @approval.user = current_user

    respond_to do |format|
      if @approval.save
        format.html { redirect_to @approval, notice: 'Approval was successfully created.' }
        format.json { render :show, status: :created, location: @approval }
      else
        format.html { render :new }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approvals/1
  # PATCH/PUT /approvals/1.json
  def update
    respond_to do |format|
      if @approval.update(approval_params)
        format.html { redirect_to @approval, notice: 'Approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @approval }
      else
        format.html { render :edit }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approvals/1
  # DELETE /approvals/1.json
  def destroy
    @approval.destroy
    respond_to do |format|
      format.html { redirect_to approvals_url, notice: 'Approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval
      @approval = Approval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_params
      params.require(:approval).permit(:approve, :user_id, :friendship_id, :subscription_id, :membership_id)
    end
end
