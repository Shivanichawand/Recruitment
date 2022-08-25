# require 'byebug'
require_relative "sign.rb"
require_relative "company.rb"
require 'byebug'

class StudentPage
	def student
		puts "\n\t\t\t\t\t#{'YOU ENTER IN STUDENTS PROFILE '}\n\n" 
    # LoginPage.new.login
		# CurrentPage.new.current
		PanelPage.new.panel("student")
		student_portfolio
	end

	def student_portfolio
		puts "1. Student Profile"
		puts "2. Applied for job"
		puts "3. Update Your profile"
		puts "4. View companies profile"
		puts "5. Back to panel"
		puts "6. Logout"
		print "Select your field : "
  	choose = gets.chomp.to_i
		case choose
		when 1
			student_profile
		when 2
			student_applied
		when 3
			student_update
		when 4
      view_company
		when 5
			PanelPage.new.start
		when 6
			Logout.new.log
		end
	end
		
	$portfolio_id = 0
	$profile_array = []

	def student_profile
		$portfolio_id += 1
		print "Enter your name : "
		@s_name = gets.chomp.to_s
		print "Enter your DOB : "
		@date_of_birth = gets.chomp
		print "Enter your age : "
		@age = gets.chomp.to_i
		print "Enter your education : "
		@education = gets.chomp
		print "Enter your percentage/cgpa : "
		@precent = gets.chomp.to_f
		print "Enter your passing year : "
		@pass_year = gets.chomp.to_i
		print "Enter your 10th precentage : "
		@percent_10 = gets.chomp.to_f
		print "Enter your 12th precentage : "
		@percent_12 = gets.chomp.to_f
		print "Enter your skills : "
		@skill = gets.chomp.to_s
		puts "\n"

		cu = LoginPage.new.current_user
		$profile_array << {fullname: @s_name, emailId: cu[:email], dob: @date_of_birth, age: @age, 
			education: @education, precent: @precent, passingYear: @pass_year, percent10: @percent_10, 
			percent12: @percent_12, skill: @skill }
		puts $profile_array
		puts "Your profile successfully created "
		student_portfolio
	end

	def find_profile
		$profile_array.find { |x| x[:emailId] == $current_user[:email] }
	end

	def student_update
		puts "\n\t\t\t\t\t#{'PLEASE UPDATE YOUR  PROFILE '}\n\n" 		
		puts "Enter your values in this format { name: 'your_name', age: 16 ......}"
			$updatable_profile = eval(gets.chomp)
			$updatable_profile.keys.each{ |key| find_profile[key] = $updatable_profile[key] }
			puts find_profile
			student_portfolio
	
	end


	def student_applied
		# byebug
		puts "Lists of Posted jobs"
		puts $post_array
		$post_array.find{ |x| x if $post_array != ' '
			puts "Which Company You want applied for job"
			$applied_company = gets.chomp.to_s
			applied_job 
		}
		  student_portfolio
	end

	$applied_id = 0
	$applied_array = []
	def applied_job
		$applied_id += 1
		print "Enter your name : "
		@a_name = gets.chomp.to_s
		print "Enter your emailId : "
		@a_email = gets.chomp
		print "Enter your DOB : "
		@a_dob = gets.chomp
		print "Enter your age : "
		@a_age = gets.chomp.to_i
		print "Enter your education : "
		@a_education = gets.chomp
		print "Enter your percentage/cgpa : "
		@a_precent = gets.chomp.to_f
		print "Enter your passing year : "
		@a_pass_year = gets.chomp.to_i
		print "Enter your skills : "
		@a_skill = gets.chomp.to_s
		print " Experience : "
		@a_experience = gets.chomp.to_s
		puts "\n"

		cu = LoginPage.new.current_user
		$applied_array << {fullname: @a_name, emailId: @a_email, dob: @a_dob, age: @a_age, 
			education: @a_education, precent: @a_precent, passingYear: @a_pass_year, skill: @a_skill, 
			experience: @a_experience, appliedcompany: $applied_company, postid: $postjob_id}
		puts $applied_array

		# $applied_array.each{ |key| find_applied = $applied_company }
		student_portfolio
	end

		def view_company
			# byebug
			puts $company_array
			puts "Which Company You want visit their profile"
			$visit = gets.chomp
			view = $company_array.find{ |x| $visit == x[:companyname]}
			puts view
			student_portfolio
		end
end

# StudentPage.new.student
