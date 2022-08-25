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
		company_portfolio
	end

	def company_portfolio
		puts "1. Create Companies Profile"
		puts "2. Post for job"
		puts "3. Update Your profile"
		puts "4. Check interset students list"
		# puts "5. Manage interview"
		puts "6. Back"
		puts "7. Logout"



		print "Select your field : "
  	company_field = gets.chomp.to_i

		case company_field
		when 1
			company_profile
		when 2
			post_jobs
		when 3
			company_update
		when 4
			student_list
		when 6
			PanelPage.new.start
		when 7
			Logout.new.log
		end
	end 
		
	$company_port_id = 0
	$company_array = []

	def company_profile
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
		company_portfolio
	end	

	$postjob_id = 0
	$post_array = []
	def post_jobs
		$postjob_id += 1
		if $company_port_id != 0
		puts find_company
		# print "Enter  Company Name : "
		# $post_name = gets.chomp.to_s
		print "Enter Required skills : "
		@post_skill = gets.chomp.to_s
		print "Enter Required education: "
		@post_education = gets.chomp
		print "Last date for Applied job : "
		@post_applied = gets.chomp
		puts "\n"

		cu = LoginPage.new.current_user
		# byebug
		 post = $company_array.find { |e| e[:companyemail] == cu[:email]}
		$post_array << {postname: post[:companyname], postemail:  cu[:email], postskill: @post_skill, posteducation: @post_education, postapplied: @post_applied}
			# byebug
			# $post_array.keys.each{ |key| post[key] = $post_array[key] }
			# $company_array.zip($post_array).map{|h1,h2| $company_array[key] == $post_array[key] ? $company_array.merge($post_array) : [$company_array ,$post_array]}.flatten
			# puts find_company
			puts $post_array
			# puts post
			
		else
		puts "there is no profile of company"
	end
		company_portfolio
	end

	def company_update
		puts "Which you want to update : "
		puts "1. Company Profile update"
		puts "2. Update post jobs"
		choice = gets.chomp.to_i
		case choice
		when 1
			company_update
		when 2
			post_update
		end
	end

	def find_company
		$company_array.find { |y| y[:companyemail] == $current_user[:email] }
	end

	def company_update
		puts "\n\t\t\t\t\t#{'PLEASE UPDATE YOUR  PROFILE '}\n\n" 		
		puts "Enter your values in this format { name: 'your_name', age: 16 ......}"
			puts find_company
			$company_update = eval(gets.chomp)
			$company_update.keys.each{ |key| find_company[key] = $company_update[key] }
			puts find_company
	end
	def find_post
		
		$post_array.find { |y| y[:postemail] == $current_user[:email] }
	end

	def post_update
		puts "\n\t\t\t\t\t#{'PLEASE UPDATE YOUR  PROFILE '}\n\n" 		
		puts "Enter your values in this format { name: 'your_name', age: 16 ......}"
		  puts find_post
			$post_update = eval(gets.chomp)
			$post_update.keys.each{ |key| find_post[key] = $post_update[key] }
			puts find_post

	end
	def current_company
		# byebug
		# $applied_array.find { |x| x[:appliedcompany] == $company_array[:companyname]}
		$company_array.find { |x| x[:companyemail] == $current_user[:email] }
		
	end
	def student_list
		$applied_array.each do |object| 
			# byebug
		 if current_company[:companyname] == object[:appliedcompany] 
		 	puts $applied_array
		 end
		end
	end
end

# CompanyProfolio.new.company_profile
# CompanyPage.new.company
