#  As we know that in the rake routes the post /users refers to the devise/registrations_controller#create 
# Now we override the Registration Controller create action

class RegistrationsController < Devise::RegistrationsController

  # here in the create action sign_up_params 
  def create
    build_resource(sign_up_params) # {"email"=>"p1@gmail.com", "password"=>"1234567"}
    resource.save # resource here refers to
    # <User id: nil, email: "p1@gmail.com", created_at: nil, updated_at: nil>
    # user object with params fixed in it by the params obtained from the api
    # resource is holding the defination of resource = User.new({email: 'p1@gmail.com', password: '1234567'})
    # 
    yield resource if block_given?
    if resource.persisted? # the persisted method checks if the records exists in the data base
      if resource.active_for_authentication? # it checks whether the resource is active for the authentication to be done
        sign_up(resource_name, resource)
        render json: {resource: resource, location: after_sign_up_path_for(resource), notice: "Succesfully Registered User" }
        # after_sign_up_path_for(resource) outputs the location to be the root path which is "/"
        # resouce gives the output as  #<User id: nil, email: "p1@gmail.com", created_at: nil, updated_at: nil>
        # resource_name gives the output as :user
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        render json:{resource: resource, location: after_inactive_sign_up_path_for(resource),notice: "signed up but #{resource.inactive_message}"}
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
