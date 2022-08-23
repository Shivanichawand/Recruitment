# require 'byebug'
require_relative "sign.rb"
require 'byebug'

class StudentPage
	def student
		puts "\n\t\t\t\t\t#{'YOU ENTER IN STUDENTS PROFILE '}\n\n" 
    # LoginPage.new.login
		# CurrentPage.new.current
		PanelPage.new.panel("student")
		puts "1. Student Profile"
		puts "2. Applied for job"
		puts "3. Update profile"
		puts "4. Check company profile"
		puts "5. Back"
		puts "6. Logout"
		print "Select your field : "
  	choose = gets.chomp.to_i
		case choose
		when 1
			profile
		when 2
			Student.new.stud
		when 3
			studentupdate
		when 4
      
		when 5
			PanelPage.new.panel
		when 6
			Logout.new.log
		end
	end
	$portfolio_id = 0
	$profile_array = []

	def profile
		$portfolio_id += 1
		print "Enter your name : "
		@s_name = gets.chomp.to_s
		print "Enter your email id : "
		@email_id = gets.chomp.to_s
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
	end

	def find_profile
		$profile_array.find { |x| x[:emailId] == $current_user[:email] }
	end

	def studentupdate
		puts "\n\t\t\t\t\t#{'PLEASE UPDATE YOUR  PROFILE '}\n\n" 		
		puts "Enter your values in this format { name: 'your_name', age: 16 ......}"
			$updatable_profile = eval(gets.chomp)
			$updatable_profile.keys.each{ |key| find_profile[key] = $updatable_profile[key] }
			puts find_profile
	end

	def applied
		$applied_id += 1
		print "Enter your name : "
		@a_name = gets.chomp.to_s
		print "Enter your email id : "
		@a_email = gets.chomp.to_s
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
		$applied_array << {fullname: @a_name, emailId: cu[:email], dob: @date_of_birth, age: @age, 
			education: @education, precent: @precent, passingYear: @pass_year, percent10: @percent_10, 
			percent12: @percent_12, skill: @skill}
		puts $profile_array
	end
end
# StudentPage.new.student
