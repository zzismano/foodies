module ApplicationHelper
  def display_profile_photo(user)
    if user.photo.attached?
      cl_image_tag @user.photo.key, class: "circular-image"
    else
      render "shared/placeholder_pic"
    end
  end
end
