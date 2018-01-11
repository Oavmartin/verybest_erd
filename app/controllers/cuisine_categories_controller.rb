class CuisineCategoriesController < ApplicationController
  def index
    @q = CuisineCategory.ransack(params[:q])
    @cuisine_categories = @q.result(:distinct => true).includes(:dishes).page(params[:page]).per(10)

    render("cuisine_categories/index.html.erb")
  end

  def show
    @dish = Dish.new
    @cuisine_category = CuisineCategory.find(params[:id])

    render("cuisine_categories/show.html.erb")
  end

  def new
    @cuisine_category = CuisineCategory.new

    render("cuisine_categories/new.html.erb")
  end

  def create
    @cuisine_category = CuisineCategory.new

    @cuisine_category.cuisine = params[:cuisine]

    save_status = @cuisine_category.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cuisine_categories/new", "/create_cuisine_category"
        redirect_to("/cuisine_categories")
      else
        redirect_back(:fallback_location => "/", :notice => "Cuisine category created successfully.")
      end
    else
      render("cuisine_categories/new.html.erb")
    end
  end

  def edit
    @cuisine_category = CuisineCategory.find(params[:id])

    render("cuisine_categories/edit.html.erb")
  end

  def update
    @cuisine_category = CuisineCategory.find(params[:id])

    @cuisine_category.cuisine = params[:cuisine]

    save_status = @cuisine_category.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/cuisine_categories/#{@cuisine_category.id}/edit", "/update_cuisine_category"
        redirect_to("/cuisine_categories/#{@cuisine_category.id}", :notice => "Cuisine category updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Cuisine category updated successfully.")
      end
    else
      render("cuisine_categories/edit.html.erb")
    end
  end

  def destroy
    @cuisine_category = CuisineCategory.find(params[:id])

    @cuisine_category.destroy

    if URI(request.referer).path == "/cuisine_categories/#{@cuisine_category.id}"
      redirect_to("/", :notice => "Cuisine category deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Cuisine category deleted.")
    end
  end
end
