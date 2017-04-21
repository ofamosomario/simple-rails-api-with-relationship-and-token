module V1
  class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :update, :destroy]

    # GET /posts
    def index
      @posts = Post.all

      render json: @posts
    end

    # GET /posts/1
    def show
      render json: @post
    end

    # POST /posts
    def create
      @post = Post.new(post_params.merge(user_id: current_user.id))

      if @post.save
        render json: @post, status: :created, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
    end

    # BOARD /board
    def board 
      @posts = Post.my_posts current_user.id

      if !@posts.empty?
        paginate json: @posts, per_page: 15
      else
        render_json_conflict_error I18n.t(:no_posts, scope: [:generics, :errors])
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def post_params
        params.permit(:message , :user_id)
      end
  end
end
