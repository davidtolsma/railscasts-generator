class AuthenticationGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def auth
    # uncomment bcrypt from the Gemfile
    gsub_file 'Gemfile', "# gem 'bcrypt-ruby', '~> 3.0.0'", "gem 'bcrypt-ruby', '~> 3.0.0'"
    run 'bundle install'
  end

  def resource
    generate "resource user email password_digest"
    #generate "migration create_users email:string password_digest:string created_at:datetime updated_at:datetime"

    remove_file "app/controllers/users_controller.rb"

    if Rails::VERSION::STRING.to_i >= 4
      copy_file "users_controller_v4.rb", "app/controllers/users_controller.rb"
    else
      copy_file "users_controller_v3.rb", "app/controllers/users_controller.rb"
    end

    remove_file "app/models/user.rb"
    copy_file "user.rb", "app/models/user.rb"
    
    if Rails::VERSION::STRING.to_i < 4

inject_into_file 'app/models/user.rb', after: "has_secure_password\n" do <<-'RUBY'
  attr_accessible :email, :password, :password_confirmation
RUBY
end
    end

    rake "db:migrate"
    
    generate "controller sessions new"

    remove_file "app/controllers/sessions_controller.rb"
    copy_file "sessions_controller.rb", "app/controllers/sessions_controller.rb"

    copy_file "users/new.html.erb", "app/views/users/new.html.erb"

    remove_file "app/views/sessions/new.html.erb"
    copy_file "sessions/new.html.erb", "app/views/sessions/new.html.erb"


inject_into_file 'app/controllers/application_controller.rb', before: "end\n" do <<-'RUBY'
  
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
RUBY
end

  inject_into_file 'app/views/layouts/application.html.erb', after: "<body>\n" do <<-'RUBY'

  <% if current_user %>
    Logged in as <%= current_user.email %>
    <%= link_to "Log Out", logout_path %>
  <% else %>
    <%= link_to "Sign Up", signup_path %> or
    <%= link_to "Log In", login_path %>
  <% end %>
  RUBY
  end

  end


  def routes
    route "resources :sessions"
    route "resources :users"

    route "get 'logout', to: 'sessions#destroy', as: 'logout'"
    route "get 'login', to: 'sessions#new', as: 'login'"
    route "get 'signup', to: 'users#new', as: 'signup'"
  end


end
