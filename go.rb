
puts "RockPaperScissors V0.1.\nMade in Ruby at GlobalGameJam 2014 at Cologne Game Lab by Martin \"Nodepond\" Wisniowski\n\n"

# font: ANSI shadow / http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=Hey-ho%20matey!!
# http://stackoverflow.com/questions/9891297/how-do-i-play-mp3-file

@items = Array.new
@items[0] = "Rock"
@items[1] = "Paper"
@items[2] = "Scissors"
@input = nil
@game_over = false

def askForInput
	puts "██╗  ██╗███████╗██╗   ██╗     ██╗  ██╗ ██████╗     ███╗   ███╗ █████╗ ████████╗███████╗██╗   ██╗██╗██╗"
	puts "██║  ██║██╔════╝╚██╗ ██╔╝     ██║  ██║██╔═══██╗    ████╗ ████║██╔══██╗╚══██╔══╝██╔════╝╚██╗ ██╔╝██║██║"
	puts "███████║█████╗   ╚████╔╝█████╗███████║██║   ██║    ██╔████╔██║███████║   ██║   █████╗   ╚████╔╝ ██║██║"
	puts "██╔══██║██╔══╝    ╚██╔╝ ╚════╝██╔══██║██║   ██║    ██║╚██╔╝██║██╔══██║   ██║   ██╔══╝    ╚██╔╝  ╚═╝╚═╝"
	puts "██║  ██║███████╗   ██║        ██║  ██║╚██████╔╝    ██║ ╚═╝ ██║██║  ██║   ██║   ███████╗   ██║   ██╗██╗"
	puts "╚═╝  ╚═╝╚══════╝   ╚═╝        ╚═╝  ╚═╝ ╚═════╝     ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝   ╚═╝   ╚═╝╚═╝"

	puts "Hey-ho Matey! Let's play a game of Rock Paper Scissors!"
	puts "Please choose:"
	puts "Hack 1 for Rock"
	puts "Type 2 for Paper"
	puts "Hit 3 for Scissors"

	@input = nil
	@input = gets.strip
end

def askForInputAgain
	puts "Please choose:"
	puts "Hack 1 for Rock"
	puts "Type 2 for Paper"
	puts "Hit 3 for Scissors"

	@input = nil
	@input = gets.strip
end

def gameOver
	@game_over = true
	puts "Game Over"
end

def invalidInput
	system "clear" unless system "cls"
	puts "Matey! Please give me a number from one - three."
	puts ""
	askForInputAgain
end

def playComputer
	@computer_played = rand(3)
end

def okLetsGamble
	puts "Ya got the " + @items[@human_played] + "!!"
	puts "Me chose the " + @items[@computer_played] + "!!"
	gameOver
end

def isInputOkay?(input)
	return (input != 1.to_s and input != 2.to_s and input != 3.to_s)
end

# the "main"
askForInput

until (@game_over)
	puts @game_over
	if isInputOkay?(@input)
		invalidInput
	else
		@human_played = @input.to_i - 1
		playComputer
		okLetsGamble
	end
end

