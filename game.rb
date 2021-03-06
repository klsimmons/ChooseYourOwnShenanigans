require_relative 'player'
require_relative 'context'
require_relative 'commands\quit_command'
require_relative 'commands\show_command'

class Game

  def initialize
    @player = Player.new
    @context = Context.new
    @commands = {
      "q" => QuitCommand.new,
      "quit" => QuitCommand.new,
      "show" => ShowCommand.new
    }
  end

  # start menu < - this could be a context too...
  # while we have a context
  #   prompt for input
  #   parse the input with Command instances
  #   context = command result
  # end
  # end menu "YOU DIED" :) || "EVERYONE ELSE DIED" :|
  # start menu
  def start
    puts @context

    until @context == :exit
      input = gets.chomp
      new_context = interpret(@commands, input, @context)
      puts new_context if new_context != @context
      @context = new_context
    end
  end

  def interpret(commands, input, context)
    args = input.split(" ")       # count dogs
    command_name = args.shift()   # command_name = count; args = [ dogs ]
    command = @commands[command_name]
    if command == nil
      puts 'You done goofed. Try again? (type "help" if you\'re totally fucked)'
      context
    else
      # command.do_the_thing(args, context)
      # select a
      command.execute(args, context)
    end
  end

end

Game.new.start


# context: { scenario, choices }
#   give scenario to repeat command
#     show repeat command immediately ("show command" bound to "repeat"?)
#   give choices to ChooseCommand instance
# repl ... ( respond to bullshit )
#          ( if show command is used, advance context ) ( "game narrative" is a graph / tree structure )
# -> next scenario?

def choice(input, *arg)
  case input.to_s
  when "s" || "status"
    @player.show_status
    choice(gets.chomp)
  when "r" || "repeat"
    puts "This will repeat the choice"
    choice(gets.chomp)
  when arg.include?(input)
    return input
  end
end

# Scenario of a context
# puts "Your dreams are interrupted by the beeping of the radio. It's not yet dawn--a message at this hour can only bring ill news.

# 'Storm's been reported in Ramsgate,' the Operator explains. 'Headed your way, and fast. We're not sure you'd be able to drive through it, and we can't risk a delay if you wait for it to pass. You need to get out ahead of this thing.'
#There isn't much time, and there's a lot to do before you can safely set out.


# These are the "choices" of the context
# [ choice, choice, choice, ...]
# choice: id, description, consequnce -> lose dogs ("action"), next context


# This is the choice command
# case choice(gets.chomp, "a", "b", "c")
# when "a"
#   if rand(2) == 1
#     puts "You barely make it"
#   else
#     puts "You are caught by the storm."
#   end
# when "b"
#   if rand(2) == 1
#     puts "Your dogs don't run as far as they should before needing rest, and it takes extra time to warm them"
#   else
#     @player.lose_dogs(1)
#     puts "A dog is lost to frostbite"
#   end
# when "c"
#   if rand(2) ==  1
#     puts "You run beside the sled to keep warm, and narrowly avoid frostbite"
#   else
#     puts "Frostbite claims your fingers."
#   end
# end
