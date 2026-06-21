namespace :dev do
  PASSWORD_DEFAULT = "123456"

  desc "Development enviroment setup"
  task setup: :environment do
    if Rails.env.development?
      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke
      Rake::Task["dev:add_default_user"].invoke
    else
      puts "You aren\"t in development environment"
    end
  end

  desc "Add default user"
  task add_default_user: :environment do
    User.create!(
      name: "Hendrew",
      email: "dev@kmail.com",
      password: PASSWORD_DEFAULT,
      active: true,
    )
  end
end
