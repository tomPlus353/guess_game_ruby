# Random Integer from 1 to 10
def guessNumber(high)
  num_to_guess = rand(1..high)
  user_num = 0 # *Initializing* user_num
  user_count = 0
  until user_num == num_to_guess
    puts "Guess a number from 1 to #{high}!"
    user_num = gets.chomp.to_i # Turning user inpu into an integer
    user_count += 1
    if user_num > num_to_guess
      puts "you guessed too high!"
    elsif user_num < num_to_guess
      puts "you guessed too low!"
    end
  end
  puts "You guessed right! It took you #{user_count} guesses!"
  return user_count
end

def computerGuess(high)
  puts "Pick a number. I will guess it."
  low = 1
  computer_num = rand(low..high) #initializing computer's number for first guess
  comp_count = 0
  feedback = ""
  puts "... thinking of a number from 1 to #{high}! If I am correct, tell me (\"CORRECT\"). If I am to high, tell me (\"HIGH\") and if too low, tell me (\"LOW\").\nPress enter to begin."
    gets.chomp
  until feedback == "correct"
    puts "How about #{computer_num}!"
    feedback = gets.chomp # Getting user feedback string
    comp_count += 1
    if feedback.downcase == "high" 
      puts "Darn it!"
      high = computer_num -1
    elsif feedback.downcase == "low"
      puts "Darn it!"
      low = computer_num + 1
    end
    computer_num = rand(low..high)
  end
  puts "I guessed right! It took me #{comp_count} guesses!"
  return comp_count
end

def find_winner(cc,uc)
  if cc == uc
    puts "It took us both #{cc} guesses, so it's a tie!"
  elsif cc > uc 
    puts "It took me #{cc-uc} more guess(es) than you, so you win! Well done!"
  elsif cc < uc 
    "It took you #{uc-cc} more guess(es) than you, so I win! Ha-ha. Better luck next time."
  end
end

puts "Let's play a guessing between you and me. First, pick an upper limit. Must be higher than 5"
high = gets.chomp.to_i
user_count = guessNumber(high)
comp_count = computerGuess(high)
find_winner(comp_count,user_count)
