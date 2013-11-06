ROLES = %w{admin user VIP}

ADMIN = {
  :name => 'Admin',
  :email => 'admin@example.com',
  :password => 'change_me'
}
ROLES.each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end

user = User.new(ADMIN)
user.save!

user.add_role :admin