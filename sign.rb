require 'byebug'

require_relative "sign.rb"
require_relative "student.rb"
require_relative "company.rb"
class LoginPage
	$user_id = 0
	$signup_user = []
	def signup(role)
		$user_id += 1
		puts "\n\t\t\t\t\t#{'Please SignUp yourself'}\n\n"
		print "Enter username : "
		$user_name = gets.chomp
		print "Enter password : "
		$user_pwd = gets.chomp
		
		registration_hash = { email: $user_name, password: $user_pwd , user_role: role } 
		$signup_user.push(registration_hash) 
				puts "#{role} signup successfully"
				puts $signup_user
				PanelPage.new.panel(role)
	end

	def login(role)
		puts "\n\t\t\t\t\t#{'Please login yourself'}\n\n"

		print "Enter your username : "
		$login_email = gets.chomp
		print "Enter password : " 
		$login_pwd = gets.chomp
		$user_hash = $signup_user.find {|x| x if x[:user_role] == role}
		if $user_hash[:email] == $login_email && $user_hash[:password] == $login_pwd 
			puts "You have successfully login"
			$current_user = $user_hash 
		else
			puts "You entered something wrong please try again"
		  PanelPage.new.panel(role)
		end
	end
	
	def current_user
		return $current_user
	end

	
end




class BackPanel
	def back_panel
		PanelPage.new.start
	end
end

class Logout
	def log
		
		puts "logout successfully"
    PanelPage.new.start
    end
end





