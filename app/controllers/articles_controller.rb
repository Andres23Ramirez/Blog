class ArticlesController < ApplicationController
	
	before_action :authenticate_usuer!, except: [:show,:index]
	before_action :set_article, except:[:index,:new, :create]

	# GET /articles
	def index
		@articles = Article.all

	end


	# GET /articles/id
	def show
		@article.update_visits_count
		@comment = Comment.new
	end


	# GET /articles/new
	def new
		@article= Article.new
	end


	# POST /articles
	def create
		
		@article = current_usuer.articles.new(article_params)
		if@article.save
			redirect_to @article
		else
			render :new
		end
	end

	def destroy
		
		@article.destroy
		redirect_to articles_path
		
	end

	def update
		
		if@article.update(article_params)
			redirect_to @article
		else
			render :edit
		end	
	end

	def edit
			
	end


	private

	def set_article
		@article = Article.find(params[:id])
	end

	def validate_user
		redirect_to new_usuer_session_path, notice: "Necesitas iniciar sesion"
	end

	def article_params
		params.require(:article).permit(:title,:body)
		
	end
	
end