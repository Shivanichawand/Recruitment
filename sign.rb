require 'byebug'

require_relative "sign.rb"
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
		# $signup_user.select {|signup_user| signup_user[role] } 
			# if role == 1
				puts "#{role} signup successfully"
			# elsif role == 2
			# 	puts "student signup successfully"
			# elsif role == 3
			# 	puts "company signup successfully"
			# else 
			# 	puts "error"
			# end
		 # }
		 puts $signup_user
		# end

		PanelPage.new.panel(role)

		# puts "You have successfully signup yourself"

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
		  PanelPage.new.panel
		end
		# $login_user = {email: $login_email, password: $login_pwd ,}
		# CurrentUser.new.current
		
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

class BackPage
	def back_page
		
	end
end


class Logout
	def log
		
		puts "logout successfully"
    PanelPage.new.start
    end
end

# class CurrentUser
		# $current_login = $signup_user
		# $current_login1 = $login_user
		# $current_role = $user_role
		# if $current_login == $signup_user || $current_login1 == $login_user
		# 	puts "You have successfully login"
		# end
# end




