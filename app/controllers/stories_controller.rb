class StoriesController < ApplicationController
  before_action :set_story, only: %i[show edit update destroy]
  before_action :find_map_asset, only: [:create]
  before_action :find_story, only: %i[show, edit, update, destroy]

  def index
    @stories = Story.all
  end

  def show
  end

  def new
    @story = Story.new
  end

  def edit
  end

  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    if @story.update(story_params)
      redirect_to @story
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_url
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.require(:story).permit(:name, :address, :category, :rating, :stuff_type, :story)
    end

    def find_map_asset
      @map_asset = MapAsset.find(params[:map_asset_id])
    end

    def find_story
      @story = Story.find(params[:id])
    end
end









  
  def create

    # Found id using before_action
    
      @comment = @article.comments.create(comment_params)

      redirect_to article_path(@article)

  end

  def show
    # Found id using before_action
  end

  def edit
    # Found id using before_action

  end

  def update
    # Found id using before_action
    @article = @comment.article
    if @comment.update(comment_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end

  end

  def destroy
    # Found id using before_action
    @article = @comment.article # Doing that because the comment will be destroied and 
    # thus unable to locate article
    
    @comment.destroy

    redirect_to article_path(@article)
  end 
























  def create

    @blog = Blog.find(params[:blog_id])

    @comment = @blog.comments.new(comment_params)

    if @comment.save

      puts "Success=============================="
      redirect_to blog_path(@blog)

    else
      puts "Failure!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    end


  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])

    @comment.destroy

    redirect_to blog_path(@blog)
  end
    

  private
  def comment_params
    params.require(:comment).permit(:title , :body)
  end
