desc "This task is called by the Heroku scheduler add-on"
task :delete_all_table => :environment do
  Message.destroy_all
  RoomUser.destroy_all
  Room.destroy_all
  User.destroy_all
end
