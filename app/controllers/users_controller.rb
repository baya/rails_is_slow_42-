class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout :false

  # GET /users
  # GET /users.json
  def index
    # calls = []
    # trace = TracePoint.new(:call) do |tp|
    #   calls << [tp.defined_class, tp.method_id, tp.lineno]
    # end
    # trace.enable
    # @users = User.all.to_a
    # trace.disable
    # pp calls.group_by(&:itself).map {|k, v| {k => v.length}}.sort_by {|h| -h.values.first }

    StackProf.run(mode: :cpu, out: 'tmp/stackprof-cpu-ar.dump') do
      @users = User.all.to_a
    end
  end

  def index_erb
    @users = User.all.to_a
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :account, :email, :phone, :zip, :address, :birthday, :age, :company, :bio, :admin)
    end
end
