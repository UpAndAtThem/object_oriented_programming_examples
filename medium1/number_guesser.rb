# Create an object-oriented number guessing class for numbers in the range 1 to 100, 
# with a limit of 7 guesses per game. The game should play like this:

# The computer will display a message informing how many guesses the player has
# The computer will prompt the player for a message
# If the guess is too high (outside of the 1-100 range) prompt invalid message
# if the number is valid inform the user if it is too low, too high, you you win!
# if the number of guesses are reached without a correct guess, inform you are out of guesses, you lose!

# NOUN
# -computer
# -player
# -message
# -guesses
# -range
# VERB
# -display
# -inform
# -guess
# -prompt
# -lose
# -win
# -reached
# STATE
# -too_high
# -too_low

require 'pry'

class GuessingGame

  attr_reader :guesses_remaining, :start_range, :end_range

  def initialize(start_range, end_range)
    @computer_choice = rand(100) + 1
    @start_range = start_range
    @end_range = end_range
    @guesses_remaining = Math.log2(size_of_range).to_i + 1
    @winner = false
  end

  def size_of_range
    end_range - start_range
  end

  def generate_num_guesses(range)
    Math.log2(size_of_range).to_i + 1
  end

  def invalid_guess_message
    puts "Invalid guess. Enter a number between 1 and 100: "
  end

  def guesses_remaining_message
    puts "You have #{guesses_remaining} guesses left"
  end

  def valid?(guess)
    (1..100).include? guess 
  end

  def player_guess
    print "Enter a number between #{start_range} and #{end_range}: "

    loop do
      guess = gets.chomp.to_i

      if valid?(guess)
        @guess = guess
        break
      end

      invalid_guess_message
    end
  end

  def result
    if @guess < @computer_choice
      puts "Your guess is too low"
    elsif @guess > @computer_choice
      puts "Your guess is too high"
    else
      puts "You Win"
      @winner = true
    end   
  end

  def decrement_guess
    @guesses_remaining -= 1
  end

  def out_of_guesses_message
    puts "You are out of guesses. You lose.\n\n"
  end

  def play
    loop do
      guesses_remaining_message
      player_guess
      result
      decrement_guess

      if @winner == true
        break
      end 

      if @guesses_remaining == 0
        out_of_guesses_message
        break
      end
      puts "\n"
    end
  end
end

game = GuessingGame.new(500, 7000)
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# You win!

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low
# You are out of guesses. You lose.

# Note that a game object should start a new game with a new number to guess with each call to #play.