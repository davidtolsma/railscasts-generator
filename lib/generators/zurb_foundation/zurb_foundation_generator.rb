class Zurb_foundationGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def install_gem
    # use thin webserver
    append_file "Gemfile", "\n\ngem 'zurb-foundation'"
    run 'bundle install'
    run 'rails g foundation:install'

    gsub_file 'app/views/layouts/application.html.erb', "<%= yield %>", '

    <nav class="top-bar">
      <ul class="title-area">
        <li class="name">
          <h1><%= link_to "Awesome Store", root_url %></a></h1>
        </li>
      </ul>
      <section class="top-bar-section">
        <ul class="right">
          <li class="divider"></li>
          <li><%= link_to "Browse Products" %></li>
          <li class="divider"></li>
          <li><%= link_to "Price List" %></li>
          <li class="divider"></li>
          <li><%= link_to "Contact Us" %></li>
          <li class="divider"></li>
          <li><%= link_to "Cart" %></li>
        </ul>
      </section>
    </nav>

    <div class="row">
      <div class="small-8 columns"><%= yield %></div>
      <div class="small-4 columns">
        <h2 class="subheader">About Us</h2>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
      </div>
    </div>
    '

  end

  def append_to_readme
    append_file 'README.md', "\n* zurb-foundation installed\n"
  end
end
