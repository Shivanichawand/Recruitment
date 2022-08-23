require_relative "sign.rb"
require 'byebug'

# class CompanyLogin
# 	def companylog
#     LoginPage.new.signup		
# 	end
# end
class CompanyPage
	def company
    # LoginPage.new.login	
		# CurrentPage.new.current
		puts "\n\t\t\t\t\t#{'YOU ENTER IN COMPANYS PROFILE '}\n\n" 
		# byebug
		PanelPage.new.panel("company")
    	
		puts "1. Check Companies Portfolio"
		puts "2. Post for job"
		puts "3. Update profile"
		puts "4. Check interset students list"
		puts "5. Manage interview"
		puts "6. Back"
		puts "7. Logout"



		print "Select your field : "
  	company_field = gets.chomp.to_i

		case company_field
		when 1
			companyprofile
		when 2
			postjobs
		when 3
			update
		when 6
			PanelPage.new.panel
		when 7
			Logout.new.log
		end
	end
	$company_port_id = 0
	$company_array = []
	def companyprofile
		$company_port_id += 1
		print "Enter  Company Name : "
		@company_name = gets.chomp.to_s
		print "We  working on that skills : "
		@com_skill = gets.chomp.to_s
		print "Our Company Experience : "
		@com_experience = gets.chomp
		puts "\n"
		# byebug
		cu = LoginPage.new.current_user
		$company_array << {companyname: @company_name, companyemail: cu[:email], companyskill: @com_skill, companyex: @com_experience}
		puts $company_array
		# companyprofile
		# companyupdate
	end	

	$postjob_id = 0
	$post_array = []
	def postjobs
		$postjob_id += 1
		print "Enter  Company Name : "
		@post_name = gets.chomp.to_s
		print "Enter Required skills : "
		@post_skill = gets.chomp.to_s
		print "Enter Required education: "
		@post_education = gets.chomp
		print "Last date for Applied job : "
		@post_applied = gets.chomp
		puts "\n"

		cu = LoginPage.new.current_user
		$post_array << {postname: @post_name, postemail:  cu[:email], postskill: @post_skill, posteducation: @post_education, postapplied: @post_applied}
		puts $post_array
		postupdate

	end

	def update
		puts "Which you want to update : "
		puts "1. Company Profile update"
		puts "2. Update post jobs"
		choice = gets.chomp.to_i
		case choice
		when 1
			companyupdate
		when 2
			postupdate
		end
	end
	def find_company
		
		$company_array.find { |y| y[:companyemail] == $current_user[:email] }
	end

	def companyupdate
		puts "\n\t\t\t\t\t#{'PLEASE UPDATE YOUR  PROFILE '}\n\n" 		
		puts "Enter your values in this format { name: 'your_name', age: 16 ......}"
			puts find_company
			$companyupdate = eval(gets.chomp)
			$companyupdate.keys.each{ |key| find_company[key] = $companyupdate[key] }
			puts find_company
	end
	def find_post
		
		$post_array.find { |y| y[:postemail] == $current_user[:email] }
	end

	def postupdate
		puts "\n\t\t\t\t\t#{'PLEASE UPDATE YOUR  PROFILE '}\n\n" 		
		puts "Enter your values in this format { name: 'your_name', age: 16 ......}"
		  puts find_post
			$companyupdate = eval(gets.chomp)
			$companyupdate.keys.each{ |key| find_post[key] = $companyupdate[key] }
			puts find_post
	end
end

# CompanyProfolio.new.company_profile
# CompanyPage.new.company
