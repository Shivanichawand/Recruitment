require_relative "sign.rb"
require 'byebug'
# class AdminLogin
# 	def adminlog

#     LoginPage.new.signup
#     AdminPage.new.admin	
# 	end
# end
class AdminPage

	def admin
    # LoginPage.new.login
		# CurrentPage.new.current
		# byebug
		puts "\n\t\t\t\t\t#{'YOU ENTER IN ADMIN PROFILE '}\n\n" 

    PanelPage.new.panel("admin")
    
		puts "1. Admin Profile"
		puts "2. Check applied jobs list"
		puts "3. Update profile"
		puts "4. Change password"
		puts "5. Check post jobs from company"
		puts "6. Check company profile"
		puts "7. Manage company "
		puts "8. Manage interview"

		puts "9. Back"
		puts "10. Back_to_PanelPage"
		puts "11. Logout"



		print "Select your field : "
  	admin_field = gets.chomp.to_i

		case admin_field
		when 1
			Profolio.new.profile
			# when 2
			# 	Student.new.stud
			# when 3
			# 	Company.new.comp
		when 9
			PanelPage.new.panel
		when 10
			BackPanel.new.back_panel
		when 11
			Logout.new.log

		end
	end
end


