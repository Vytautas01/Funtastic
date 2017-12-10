class Function
def initialize (luser, lpass, username, password, user_log, enter, a, achoice)
@luser = luser
@lpass = lpass
@username = username
@password = password
@enter = enter
@a = a
@achoice = achoice
end
def self.user_log	
schoice = ""																				#USER LOG - if login input is correct, this is the method that activates. All main user operations are here.				
		def self.sinfo
			puts " --Student info --"
			File.open("#{@username}.txt", "r").each_line do |line|
			puts line
			end
			puts "\n Enter 3 to exit"
			end
		def self.quiz																		#TAKE QUIZ - if this method is called, user will be able to choose the quiz and take it.
			puts "\n ATTENTION! type carefully and mind capital letters too!"
			puts "To select your quiz type its name \n List of existing quizes:"
				q = File.new("Quiz_list.txt", "a+")
				open("Quiz_list.txt", "r").each_line do |line|
				puts line
				q.close
				end
			@enter = gets.chomp
if	File.exists?("Quiz_#{@enter}.txt")	
filename = "Quiz_#{@enter}.txt"
puts ""
def self.read_line_number(filename, number)													#LINE READING METHOD - a method which is used to read particular lines.
  return nil if number < 1
  line = File.readlines(filename)[number-1]
  line ? line.chomp : nil
end
sum = 0
i = 1
v1 = 1
v2 = 4
v3 = 5
n = 0
t = File.readlines(filename)[0]
until n == t.to_i																			#READING LINES EQUATION - text files have a specific pattern in which these number have to change.
puts ""
	while ( v1 <= i and i <= v2)
	i+= 1
	puts read_line_number("#{filename}", i)
	end
		qa = gets.chomp
		check = File.readlines(filename)[v3]												#CHECK ANSWER - this particular line targets the location of correct answer and brings it to IF statement.
		check ||= '' 
		check.chomp!
	if (check == qa)
	sum = sum + 1
	else
	sum = sum + 0
	end
n += 1
i = i + 2
v1 = v1+ 6
v2 = v2+ 6
v3 = v3+ 6
end
puts "\n You have completed this quiz ( enter 3 to exit )"
puts " Your score is #{sum}/#{t}"
z = File.new("#{@username}.txt", "a+")
z.puts("Took #{@enter} quiz ... Score: #{sum}/#{t}")		
z.close
x = File.new("User_quiz_log.txt", "a+")
x.puts("#{@username} Took #{@enter} quiz ... Score: #{sum}/#{t}")
x.close
end
end
puts " ---------------- \n Welcome, #{@username} \n 1. Take a quiz \n 2. Check your info \n 3. Exit"
	while schoice != 3																		#USER MENU - displays user menu and gies a list of choices, which lead to methods.
	schoice = gets.chomp.to_i
		if schoice == 1
			puts quiz
		end
		if schoice == 2
			puts sinfo
		end
	end	
end

def self.admin_log																			#ADMIN MENU - this method brings out the whole admin operations.
	def self.create																			#QUIZ LIST CREATE - quiz_list.txt is created to store all quiz names.
		puts "Enter topic of quiz"
		topic = gets.chomp
			q = File.new("Quiz_list.txt", "a+")
			q.puts(topic)
			q.close
		f = File.new("Quiz_#{topic}.txt", "a+")
		puts "How many questions will #{topic} have?"										#QUIZ CREATE - creates quizes depending on how many questions there are.
		@a = gets.chomp.to_i
		f.puts(@a)
		@a.times do
			open("Quiz_#{topic}.txt", "a+")
		puts "Enter the question"
			quest = gets.chomp
		puts "Enter the first answer"
			ans1 = gets.chomp
		puts "Enter the second answer"
			ans2 = gets.chomp
		puts "Enter the third answer"
			ans3 = gets.chomp
		puts "What is the right answer? (Type exatly the same word)"
			rans = gets.chomp
			f.puts(quest, ans1, ans2, ans3, rans, "\n")
				end
		f.close
		puts "\n *Quiz was successfully created* \n"
		sleep (1)
		puts admin_log
	end
		def self.seeinfo																#CHECK STUDENT INFO - this method opens a file which shows how students perform.
			if File.exist?("User_quiz_log.txt")
				File.open("User_quiz_log.txt", "r").each_line do |line|
				puts line
				end
			else
				puts "No tests were taken yet..."
			end
			sleep (1)
			puts admin_log
		end
puts "\n - Administrator menu - \n 1. Create a test \n 2. Check student scores \n 3. exit"
@achoice = 0
	while @achoice != 3
		puts "\n Enter your action: "
		@achoice = gets.chomp.to_i
		if @achoice == 1
			puts create
		end
			if @achoice == 2
				puts seeinfo
			end
	end
end
puts
puts " Welcome! "
choice = ""
while choice != 4																				#MAIN MENU - every user starts here. Simple while menu.
puts "\n -MENU- "
puts " 1. Create new user \n 2. Login with existing user  \n 3. Admin menu \n 4. Exit"
choice = gets.chomp.to_i
	if choice == 1																				#CREATE USER - will make a new file and store user's inputs.
		puts "Enter your new username:"					
			@luser = gets.chomp.upcase
			f = File.new("#{@luser}.txt", "a+")
		puts "Enter you new password:"
			open("#{@luser}.txt", "w")
			@lpass = gets.chomp.downcase
			f.puts(@luser, @lpass)
		puts " \n *Your account was successfully created*"
			f.close
			sleep(2)
	end
		if choice == 2																			#USER LOGIN - checking if the user has a file and if it matches his information.
			puts "Enter your existing username:"
				@username = gets.chomp.upcase
				if !File.exists?("#{@username}.txt")
					puts " There is no such user "
				else
					puts "Enter your existing password:"
					@password = gets.chomp.downcase
					if File.read("#{@username}.txt").include?(@password)
						puts user_log
					else
						puts " \n Incorrect password  \n"
					end
				end
		end
			if choice == 3																		#ADMIN LOGIN - really simple. Just enter the constant all-admin-access password.
				puts "Enter administrator password"
				adpass = gets.chomp.to_i
					if adpass == 1337
						puts admin_log
					else
						puts " \n Incorrect password \n"
				end
			end
end
end
