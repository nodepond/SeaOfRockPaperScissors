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
	puts "OO_  OO_OOOOOOO_OO_   OO_     OO_  OO_ OOOOOO_     OOO_   OOO_ OOOOO_ OOOOOOOO_OOOOOOO_OO_   OO_OO_OO_"
	puts "OO_  OO_OO______OO_  OO__     OO_  OO_OO____OO_    OOOO_ OOOO_OO___OO____OO____OO_______OO_ OO__OO_OO_"
	puts "OOOOOOO_OOOOO_   _OOOO__OOOOO_OOOOOOO_OO_   OO_    OO_OOOO_OO_OOOOOOO_   OO_   OOOOO_   _OOOO__ OO_OO_"
	puts "OO___OO_OO____    _OO__ ______OO___OO_OO_   OO_    OO__OO__OO_OO___OO_   OO_   OO____    _OO__  ______"
	puts "OO_  OO_OOOOOOO_   OO_        OO_  OO__OOOOOO__    OO_ ___ OO_OO_  OO_   OO_   OOOOOOO_   OO_   OO_OO_"
	puts "___  ___________   ___        ___  ___ _______     ___     ______  ___   ___   ________   ___   ______"

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
	elsif @input == "search for treasure"
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
	

	puts " OOOOOO_  OOOOO_ OOO_   OOO_OOOOOOO_     OOOOOO_ OO_   OO_OOOOOOO_OOOOOO_ "
	puts "OO______ OO___OO_OOOO_ OOOO_OO______    OO____OO_OO_   OO_OO______OO___OO_"
	puts "OO_  OOO_OOOOOOO_OO_OOOO_OO_OOOOO_      OO_   OO_OO_   OO_OOOOO_  OOOOOO__"
	puts "OO_   OO_OO___OO_OO__OO__OO_OO____      OO_   OO__OO_ OO__OO____  OO___OO_"
	puts "_OOOOOO__OO_  OO_OO_ ___ OO_OOOOOOO_    _OOOOOO__ _OOOO__ OOOOOOO_OO_  OO_"
 	puts " _______ ___  ______     ___________     _______   _____  ___________  ___"
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
	puts "   It is open sourced and available at github:"
	puts "         https://github.com/nodepond/SeaOfRockPaperScissors"
	puts "   Feel free to contribute! Who knows what this game will develop into!"
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
	puts " OOOOOO_ OO_  OO_OO_"
	puts "OO____OO_OO_  OO_OO_"
	puts "OO_   OO_OOOOOOO_OO_"
	puts "OO_   OO_OO___OO____"
	puts "_OOOOOO__OO_  OO_OO_"
	puts " _______ ___  ______"
 	puts "We both chosed the same. Let's play again."
 	@games_tie += 1
 	stats
end

def playerWon
	puts " OOOOOO_ OOOOOO_ OOO_   OO_ OOOOOO_ OOOOOO_  OOOOO_ OOOOOOOO_OOOOOOO_OO_OO_"
	puts "OO______OO____OO_OOOO_  OO_OO______ OO___OO_OO___OO____OO____OO______OO_OO_"
	puts "OO_     OO_   OO_OO_OO_ OO_OO_  OOO_OOOOOO__OOOOOOO_   OO_   OOOOOOO_OO_OO_"
	puts "OO_     OO_   OO_OO__OO_OO_OO_   OO_OO___OO_OO___OO_   OO_   _____OO_______"
	puts "_OOOOOO__OOOOOO__OO_ _OOOO__OOOOOO__OO_  OO_OO_  OO_   OO_   OOOOOOO_OO_OO_"
	puts " _______ _______ ___  _____ _______ ___  ______  ___   ___   ______________"
    puts ""                                                                       
	puts "You won!!"

	puts ""                                                                       
	puts "Please tell me what you need in order to succeed? (Or just return to idle)"
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
	puts " OOOOOO_ OOOOOO_ OOO_   OO_ OOOOOO_ OOOOOO_  OOOOO_ OOOOOOOO_OOOOOOO_OO_OO_"
	puts "OO______OO____OO_OOOO_  OO_OO______ OO___OO_OO___OO____OO____OO______OO_OO_"
	puts "OO_     OO_   OO_OO_OO_ OO_OO_  OOO_OOOOOO__OOOOOOO_   OO_   OOOOOOO_OO_OO_"
	puts "OO_     OO_   OO_OO__OO_OO_OO_   OO_OO___OO_OO___OO_   OO_   _____OO_______"
	puts "_OOOOOO__OOOOOO__OO_ _OOOO__OOOOOO__OO_  OO_OO_  OO_   OO_   OOOOOOO_OO_OO_"
	puts " _______ _______ ___  _____ _______ ___  ______  ___   ___   ______________"
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
	puts "OO_  OO_ OOOOO_     OO_  OO_ OOOOO_ OO_"
	puts "OO_  OO_OO___OO_    OO_  OO_OO___OO_OO_"
	puts "OOOOOOO_OOOOOOO_    OOOOOOO_OOOOOOO_OO_"
	puts "OO___OO_OO___OO_    OO___OO_OO___OO____"
	puts "OO_  OO_OO_  OO_    OO_  OO_OO_  OO_OO_"
	puts "___  ______  ___    ___  ______  ______"
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

	if @input == 1.to_s or @input == 'Rock'
		@human_played = 0
	elsif @input == 2.to_s or @input == "Paper"
		@human_played = 1
	elsif @input == 3.to_s or @input == "Scissors"
		@human_played = 2
	end
	
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

def isInputOkay?

	okay = false

	if (@input == 1)
		okay = true
	elsif (@input == 2)
		okay = true
	elsif (@input == 3)
		okay = true
	end

	return okay
end

# the "main"
scnclr
askForInput

until (@game_over)
	if isInputOkay?
		invalidInput
	else
		playComputer
		okLetsGamble
	end
end
gameOver

