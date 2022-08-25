require_relative "admin.rb"

require_relative "student.rb"
require_relative "company.rb"
require 'byebug'

# puts "\n\t\t\t\t\t#{'Please signup yourself'.light_yellow.on_cyan}\n\n" 

class PanelPage
	def start
		puts "1. Admin Panel"
		puts "2. Student Panel"
		puts "3. Company Panel"
		puts "4. Exit"

		print "Select your field : "
		choose = gets.chomp.to_i

		# $user_role = ''
		case choose
		when 1
			# byebug
			# $user_role = 'admin'
			AdminPage.new.admin
		when 2
			# byebug
			# $user_role = 'student'
			StudentPage.new.student
		when 3
			# byebug
		  # $user_role = 'company'
			CompanyPage.new.company
		when 4
			Logout.new.log
		else
			puts "Your write something wrong please try again "
    end
    # panel
  end

	# def mainmenu
	# 	puts "1. Admin"
	# 	puts "2. Student"
	# 	puts "3. Company"
	# 	print "Select your field : "
	# 	$back = gets.chomp.to_i

	# 	case $back
	# 	when 1
	# 		CurrentUser.new.current			
	# 		AdminPage.new.admin
	# 	when 2
	# 		# CurrentPage.new.current
	# 	CurrentUser.new.current

	# 		StudentPage.new.student
	# 	when 3
	# 	CurrentUser.new.current
			
	# 		CompanyPage.new.company
	# 	when 4
	# 		Logout.new.log
	# 	else
	# 		puts "Your write something wrong please try again "
 #      start

	# 	end

	# end
	def panel(role)
		puts "1. SignUp"
		puts "2. Login"
		puts "3. Back"
		puts "4. Exit"
		print "Select your field : "
		$back = gets.chomp.to_i

		case $back
		when 1
			LoginPage.new.signup(role)
			# panel(x)
		when 2
			LoginPage.new.login(role)
		when 3
			PanelPage.new.start
		when 4
			Logout.new.log
		else
			puts "Your write something wrong please try again "
      start

		end

	end
end
PanelPage.new.start











