#Player name
player_name = ""

#An array to store all the guesses
my_guesses = []

#The current guess as entered by the user
my_guess = ""

#The current guess converted to an integer
my_number = 0

#If true then keep playing the game
keep_playing = true

#If true then we keep guessing within a match
#false bails us out of the match and the game
keep_guessing = true

#What I just said, too low or too high
i_just_said = "nothing"

#Current count of guesses
guess_count = 0

#Maximum number of guesses
max_guesses = 5

#pick a number, integer between 0 and 100
#This could be rand or use milliseconds
def pick_a_number
  your_number = Time.new.usec/10000
end

#check to see if they got it
def did_you_get_it(my_number, your_number)
  my_number == your_number
end

#check how many guesses they've made
def check_guesses (guess_count, max_guesses)
  guess_count == max_guesses
end

#check to see if it's a number
def is_this_a_number (my_guess)
  Integer(my_guess) rescue false
end

#start the match
while keep_playing do
  #reset the variables
  my_guesses = []
  my_guess = ''
  my_number = 0
  keep_guessing = true
  i_just_said = "nothing"
  guess_count = 0
  got_it = false
  out_of_guesses = false

  #get the player name
  puts "Enter your name."
  player_name = gets.chomp

  #start match
  if player_name == ""
    keep_playing = false
  else

    #pick a number
    your_number = pick_a_number
    puts "OK. I've got a number."

    #Popping the number up for debugging
    puts your_number

    #As long as we're supposed to keep guessing and have not
    #guessed the correct answer we will loop.
    got_it = did_you_get_it(my_number, your_number)
    while keep_playing && keep_guessing && (not got_it) do

      puts "Enter Your Guess"
      my_guess = gets.chomp
      my_number = is_this_a_number(my_guess)

      #Put this in so you can quit the match and game
      #skip all code that follows
      if my_guess == ''
        keep_guessing = false
        keep_playing = false

      else
        #Add to the guess count
        guess_count += 1

        #Check to see if they've maxed out their guesses
        out_of_guesses = check_guesses(guess_count, max_guesses)
        if out_of_guesses
          keep_guessing = false
        end

        #Let's make sure it's a number. If not, don't do any
        #logic on the guess, just add to the guesses and
        #count the guess
        my_number = is_this_a_number(my_guess)
        if not my_number
          puts "That's not a number. You just wasted a guess."
        else

          #If they get it, then don't do any logic
          got_it = did_you_get_it(my_number, your_number)
          if not (got_it)

            #Check to see if they reguessed a previous guess
            #If so, let them know and don't do any
            #logic on the new guess
            if my_guesses.include? my_guess
              puts "You already guessed that."
              else

              #Check if it's too high or too low
              #Once we have a 2nd guess
              #Check to see if the number is lower than the last
              #guess and I just said too low or
              #higher than the last guest and I just said too high
              if my_number < your_number
                if my_guesses.count >= 1 && my_number < Integer(my_guesses.last) && i_just_said == "too low"
                  puts "What did I just say? Now you're even lower."
                else
                  puts "Too low."
                end
                i_just_said = "too low"
              elsif my_number > your_number
                if my_guesses.count >= 1 && my_number > Integer(my_guesses.last) && i_just_said == "too high"
                  puts "What did I just say? Now you're even higher."
                else
                  puts "Too high."
                end
                i_just_said = "too high"
              end
            end
          end

          #Add the guess to their guesses, now that we've done
          #all that, unless they quit or run out of guesses
          my_guesses << my_guess

        end
      end
    end

    if got_it
      puts "You got it!"
    elsif out_of_guesses
      puts "You're out of guesses."
    else
      puts "Quitter!"
    end
  end
end

puts "That's the end of the match."
