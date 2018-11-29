require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/articles' do
    binding.pry

    # @article = Article.create(params[:name], params[:content])
    # @article.name = params[:name]
    @post = Post.create(title: params[:name], content: params[:content])
    # @article.content = params[:content]
    # binding.pry
    # @article.title = params[:title]

    erb :index
  end


  patch '/posts/:id' do  #updates a post
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end


  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect to '/posts'
  end


end
