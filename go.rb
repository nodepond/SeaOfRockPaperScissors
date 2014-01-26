load 'asciiart.rb'

puts "RockPaperScissors V0.1.\nMade in Ruby at GlobalGameJam 2014 at Cologne Game Lab by Martin \"Nodepond\" Wisniowski\n\n"

# font: ANSI shadow / http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=Hey-ho%20matey!!

@items = Array.new
@items[0] = "Rock"
@items[1] = "Paper"
@items[2] = "Scissors"
@input = nil
@game_over = false

@games_played = 0
@games_won = 0
@games_lost = 0
@games_tie = 0


# helpers
def scnclr
	system "clear" unless system "cls"
	logo
end

# the methods
def askForInput
	scnclr
	puts "██╗  ██╗███████╗██╗   ██╗     ██╗  ██╗ ██████╗     ███╗   ███╗ █████╗ ████████╗███████╗██╗   ██╗██╗██╗"
	puts "██║  ██║██╔════╝╚██╗ ██╔╝     ██║  ██║██╔═══██╗    ████╗ ████║██╔══██╗╚══██╔══╝██╔════╝╚██╗ ██╔╝██║██║"
	puts "███████║█████╗   ╚████╔╝█████╗███████║██║   ██║    ██╔████╔██║███████║   ██║   █████╗   ╚████╔╝ ██║██║"
	puts "██╔══██║██╔══╝    ╚██╔╝ ╚════╝██╔══██║██║   ██║    ██║╚██╔╝██║██╔══██║   ██║   ██╔══╝    ╚██╔╝  ╚═╝╚═╝"
	puts "██║  ██║███████╗   ██║        ██║  ██║╚██████╔╝    ██║ ╚═╝ ██║██║  ██║   ██║   ███████╗   ██║   ██╗██╗"
	puts "╚═╝  ╚═╝╚══════╝   ╚═╝        ╚═╝  ╚═╝ ╚═════╝     ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝   ╚═╝   ╚═╝╚═╝"

	puts "If you want to pass, you have to win a game of Rock, Paper, Scissors against me!"
	puts ""
	puts "So please choose:"
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

def askForAnotherGame
	puts ""
	puts "Do you choose to play again?"
	puts "Press return to play."
	puts "Or enter 'coward' to quit"
	puts ""

	@input = nil
	@input = gets.strip

	if @input == ""
		askForInput
	elsif @input == "coward"
		@game_over = true
	end
			
end

def stats
	puts ""
	puts ">-----[ S T A T S ]---------------------------------------------------<"
	puts "   Games played: " + @games_played.to_s
	puts "   Games won: " + @games_won.to_s
	puts "   Games lost: " + @games_lost.to_s
	puts "   Games tie: " + @games_tie.to_s
	puts ""
	puts ">-----[ I N F o ]-----------------------------------------------------<"
	puts "   This silly game was made by 'Nodepond'"
	puts "         for Global Game Jam 2014 at Cologne Game Lab."
	puts "   It is open sourced and available at github."
	puts "         Who knows what this game will develop into!!"
	puts "   Feel free to contribute!"
	puts "°'''''°'°'°'''°''°'°''''°''°'''°''°'°''°'°''°'°'°''''°''°'°'°'°'°°°'''°"
	
	askForAnotherGame
end

def gameOver
	@game_over = true
	scnclr
	puts " ██████╗  █████╗ ███╗   ███╗███████╗     ██████╗ ██╗   ██╗███████╗██████╗ "
	puts "██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔═══██╗██║   ██║██╔════╝██╔══██╗"
	puts "██║  ███╗███████║██╔████╔██║█████╗      ██║   ██║██║   ██║█████╗  ██████╔╝"
	puts "██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ██║   ██║╚██╗ ██╔╝██╔══╝  ██╔══██╗"
	puts "╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ╚██████╔╝ ╚████╔╝ ███████╗██║  ██║"
 	puts " ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝     ╚═════╝   ╚═══╝  ╚══════╝╚═╝  ╚═╝"
 	puts ""
	puts ">-----[ S T A T S ]---------------------------------------------------<"
	puts "   Games played: " + @games_played.to_s
	puts "   Games won: " + @games_won.to_s
	puts "   Games lost: " + @games_lost.to_s
	puts "   Games tie: " + @games_tie.to_s
	puts ""
	puts ">-----[ I N F o ]-----------------------------------------------------<"
	puts "   This silly game was made by 'Nodepond'"
	puts "         for Global Game Jam 2014 at Cologne Game Lab."
	puts "   It is open sourced and available at github."
	puts "         Who knows what this game will develop into!!"
	puts "   Feel free to contribute!"
	puts "°'''''°'°'°'''°''°'°''''°''°'''°''°'°''°'°''°'°'°''''°''°'°'°'°'°°°'''°"
	
	puts "Oh you coward, you left the game. No matter what the stats say, now I won!!"
	puts ""
end

def invalidInput
	puts "Matey! Please give me a number from one - three."
	puts ""
	askForInputAgain
end

def playComputer
	@computer_played = rand(3)
end

def tie
	scnclr
	puts " ██████╗ ██╗  ██╗██╗"
	puts "██╔═══██╗██║  ██║██║"
	puts "██║   ██║███████║██║"
	puts "██║   ██║██╔══██║╚═╝"
	puts "╚██████╔╝██║  ██║██╗"
	puts " ╚═════╝ ╚═╝  ╚═╝╚═╝"
 	puts "We both chosed the same. Let's play again."
 	@games_tie += 1
 	stats
end

def playerWon
	scnclr
	puts " ██████╗ ██████╗ ███╗   ██╗ ██████╗ ██████╗  █████╗ ████████╗███████╗██╗██╗"
	puts "██╔════╝██╔═══██╗████╗  ██║██╔════╝ ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║"
	puts "██║     ██║   ██║██╔██╗ ██║██║  ███╗██████╔╝███████║   ██║   ███████╗██║██║"
	puts "██║     ██║   ██║██║╚██╗██║██║   ██║██╔══██╗██╔══██║   ██║   ╚════██║╚═╝╚═╝"
	puts "╚██████╗╚██████╔╝██║ ╚████║╚██████╔╝██║  ██║██║  ██║   ██║   ███████║██╗██╗"
	puts " ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝╚═╝"
    puts ""                                                                       
	puts "You won!!"
	@games_won += 1
	stats
end

def playerLost
	scnclr
	puts "██╗  ██╗ █████╗     ██╗  ██╗ █████╗ ██╗"
	puts "██║  ██║██╔══██╗    ██║  ██║██╔══██╗██║"
	puts "███████║███████║    ███████║███████║██║"
	puts "██╔══██║██╔══██║    ██╔══██║██╔══██║╚═╝"
	puts "██║  ██║██║  ██║    ██║  ██║██║  ██║██╗"
	puts "╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝"
	puts ""
	puts "You lost!"
	puts ""
	@games_lost += 1
	stats
end

#@items[0] = "Rock"
#@items[1] = "Paper"
#@items[2] = "Scissors"
def isWinningCondition?(human, computer)
	won = false
	if human == 0 and computer == 2
		won = true
	elsif human == 1 and computer == 0
		won = true
	elsif human == 2 and computer == 1
		won = true
	end
	return won
end

def okLetsGamble
	puts "Ya got the " + @items[@human_played] + "!!"
	puts "Me chose the " + @items[@computer_played] + "!!"
	@games_played += 1
	
	if @human_played == @computer_played
		tie
	elsif isWinningCondition?(@human_played, @computer_played)
		playerWon
	else
		playerLost	
	end
end

def isInputOkay?(input)
	return (input != 1.to_s and input != 2.to_s and input != 3.to_s)
end

# the "main"
scnclr
askForInput

until (@game_over)
	if isInputOkay?(@input)
		invalidInput
	else
		@human_played = @input.to_i - 1
		playComputer
		okLetsGamble
	end
end
gameOver

