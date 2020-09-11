class PostsController < ApplicationController
    # GET /posts
    def index
        @posts = Post.all
        # if params[:id]
        #     @posts = Post.where(:id => params[:id])
        # else
        #     @posts = Post.all
        # end
    end 

    # GET /posts/1
    def show 
        @post = Post.find(params[:id])
        @oishiso = Oishiso.new
        @tellme = Tellme.new
    end 

    # GET /posts/new
    def new
        @post_form = PostForm.new(Post.new)
    end

    # GET /posts/1/edit
    def edit
        @post = Post.find(params[:id])
        @post_form = PostForm.new(@post)
    end

    # POST /posts
    def create
        @post_form = PostForm.new(Post.new(user_id: current_user.id))
        @post_form.apply(post_form_params)

        if @post_form.save
            redirect_to action: 'index'
        else
            render :new
        end
    end 

    # PATCH/PUT /posts/1
    def update
        @post = Post.find(params[:id])
        @post_form = PostForm.new(@post)
        @post_form.apply(post_form_params)

        if @post_form.save
            redirect_to action: 'index'
        else
            render :edit 
        end
    end

    # DELETE /posts/1
    def destroy 
        post = Post.find(params[:id])
        post.destroy 
        redirect_to posts_url
    end

    private

    def post_form_params
        params.require(:post).permit(:name, :image)
    end


end
