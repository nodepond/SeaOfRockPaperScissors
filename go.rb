load 'asciiart.rb'
load 'talkengine.rb'

puts "RockPaperScissors V0.1.\nMade in Ruby at GlobalGameJam 2014 at Cologne Game Lab by Martin \"Nodepond\" Wisniowski\n\n"

# font: ANSI shadow / http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=Hey-ho%20matey!!

@items = Array.new
@items[0] = "Rock"
@items[1] = "Paper"
@items[2] = "Scissors"
@input = nil
@game_over = false
@gameover_condition = ""

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
	puts "Do you choose to play again? Press return to play."
	puts "Or enter 'coward' to quit"
	puts ""

	@input = nil
	@input = gets.strip

	if @input == ""
		askForInput
	elsif @input == "coward"
		@gameover_condition = "coward"
		@game_over = true
	elsif @input == "head for treasure"
		@gameover_condition = "treasure"
		@game_over = true
	elsif @input == "swordfight"
		@gameover_condition = "swordfight"
		@game_over = true
	elsif @input == "go stealing"
		@gameover_condition = "steal"
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
	#puts "°'''''°'°'°'''°''°'°''''°''°'''°''°'°''°'°''°'°'°''''°''°'°'°'°'°°°'''°"
	
	askForAnotherGame
end

def gameOver
	@game_over = true
	scnclr

	if @gameover_condition == "coward"
		puts "Oh you coward, you left the game. No matter what the stats say, now I won!!"
	elsif @gameover_condition == "treasure"
		puts "Excellent matey! Let's stop this silly game and go out to find some precious loot!!"
	elsif @gameover_condition == "swordfight"
		puts "So you want to fight a pirate like me? Here's my sword!"
	elsif @gameover_condition == "steal"
		puts "(You stole a bottle of rum from the pirate.)"
	end
	puts ""
	

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
	#puts "°'''''°'°'°'''°''°'°''''°''°'''°''°'°''°'°''°'°'°''''°''°'°'°'°'°°°'''°"
	
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
	puts " ██████╗ ██████╗ ███╗   ██╗ ██████╗ ██████╗  █████╗ ████████╗███████╗██╗██╗"
	puts "██╔════╝██╔═══██╗████╗  ██║██╔════╝ ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║"
	puts "██║     ██║   ██║██╔██╗ ██║██║  ███╗██████╔╝███████║   ██║   ███████╗██║██║"
	puts "██║     ██║   ██║██║╚██╗██║██║   ██║██╔══██╗██╔══██║   ██║   ╚════██║╚═╝╚═╝"
	puts "╚██████╗╚██████╔╝██║ ╚████║╚██████╔╝██║  ██║██║  ██║   ██║   ███████║██╗██╗"
	puts " ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝╚═╝"
    puts ""                                                                       
	puts "You won!!"

	puts ""                                                                       
	puts "Please tell me what you need in order to succeed?"
	succeed = gets.strip
	if succeed == ""
		# skip this
	else
		@user_wisdoms_more << succeed
	
		puts "And now tell me what to avoid order to succeed?"
		avoid = gets.strip
		@user_wisdoms_less << avoid
	end


	scnclr
	puts " ██████╗ ██████╗ ███╗   ██╗ ██████╗ ██████╗  █████╗ ████████╗███████╗██╗██╗"
	puts "██╔════╝██╔═══██╗████╗  ██║██╔════╝ ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║"
	puts "██║     ██║   ██║██╔██╗ ██║██║  ███╗██████╔╝███████║   ██║   ███████╗██║██║"
	puts "██║     ██║   ██║██║╚██╗██║██║   ██║██╔══██╗██╔══██║   ██║   ╚════██║╚═╝╚═╝"
	puts "╚██████╗╚██████╔╝██║ ╚████║╚██████╔╝██║  ██║██║  ██║   ██║   ███████║██╗██╗"
	puts " ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝╚═╝"
    puts ""                                                                       
	puts "You won!!"

	if @user_wisdoms_more.length > 0
		rnd = rand(@user_wisdoms_more.length)
		puts ""
		puts ">-----[ Y O U   S A Y ]-----------------------------------------------<"
		puts "   "
		puts "   'If you want to get wise, you will need more " + @user_wisdoms_more[rnd]
		puts "       while trying to avoid " + @user_wisdoms_less[rnd]+"."
		puts ""
	end

	@games_won += 1
	stats
end

def playerLost
	puts "██╗  ██╗ █████╗     ██╗  ██╗ █████╗ ██╗"
	puts "██║  ██║██╔══██╗    ██║  ██║██╔══██╗██║"
	puts "███████║███████║    ███████║███████║██║"
	puts "██╔══██║██╔══██║    ██╔══██║██╔══██║╚═╝"
	puts "██║  ██║██║  ██║    ██║  ██║██║  ██║██╗"
	puts "╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝"
	puts ""
	puts "You lost!"
	rnd = rand(@computer_wisdoms.length)
	puts ""
	puts ">-----[ P I R A T E   S A Y S ]---------------------------------------<"
	puts ""
	puts "   " + @computer_wisdoms[rnd]
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
	scnclr
	puts "Ya got the " + @items[@human_played] + "!! " + "Me chose the " + @items[@computer_played] + "!!"
	puts ""
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

