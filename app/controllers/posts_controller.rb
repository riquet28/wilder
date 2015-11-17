class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @newpost = Post.new
    @users = User.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def messageposts
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @posts = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @newpost = Post.new(post_params)
    if @newpost.save
      flash[:success] = 'Your Post was successfully created.'
      redirect_to root_path
    else
      flash[:danger] = 'There was a problem creating the Post.'
      format.html { render :new }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        flash[:success] = 'Your Post was successfully updated.'
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        flash[:danger] = 'There was a problem updating the Post.'
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      flash[:success] = 'Todo was successfully destroyed.'
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :content, :avatar)
    end
end
