class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do # read
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do # create
    erb :new
  end

  post '/recipes' do # create
    # name = params[:name]
    # ingredients = params[:ingredients]
    # cook_time = params[:cook_time]
    # recipes = Recipe.create(name: name, ingredients: ingredients, cook_time: cook_time)
    recipes = Recipe.create(params)
    redirect "/recipes/#{recipes.id}"
  end

  get '/recipes/:id' do # read & delete
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do # update
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do # update
    recipe = Recipe.find(params[:id])
    # recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.update(params)
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do # delete
    Recipe.destroy(params[:id])
    # recipe = Article.find(params[:id])
    # recipe.delete
    redirect '/recipes'
  end

end
