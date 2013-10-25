desc "Create admin user"
task :create_user => :environment do
    puts "Creating Admin User #{Date.today}"
    User.create(email: "admin@example.com", password: "test", password_confirmation: "test")
end

