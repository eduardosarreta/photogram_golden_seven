class PhotosController < ApplicationController

  def index
    @list_of_all_my_photos = Photo.all
    render("photos/index.html.erb")
  end

  def show
    the_id = params[:da_id]
    @my_photo = Photo.find(the_id)
    render("photos/show.html.erb")
  end

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row
    url = params[:da_source]
    cap = params[:da_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save
    # render("photos/create_row.html.erb")
    redirect_to("/photos")

  end

  def edit_form
    render("photos/edit_form.html.erb")
  end

  def update_row
    render("photos/update_row.html.erb")
  end

  def destroy_row
    id_of_row_to_be_destroyed = params[:id]
    row_to_be_destroyed = Photo.find(id_of_row_to_be_destroyed)
    row_to_be_destroyed.destroy
    redirect_to("/photos")
  end

end
