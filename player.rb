class Player
  STARTING_MEDS = 20
  STARTING_DOGS = 10

  def initialize
    @medicine = STARTING_MEDS
    @dogs = STARTING_DOGS
    @hypothermia = false
  end


  def count_meds
    puts "#{STARTING_MEDS - @medicine} vials have been lost" if @medicine < STARTING_MEDS
    puts "You have #{@medicine} vials left."

  end

  def lose_meds(i)
    @medicine -= i
  end

  def count_dogs
    puts "You have #{@dogs} dogs on your team."
    puts "#{STARTING_DOGS - @dogs} dogs have died on the journey." if @dogs < STARTING_DOGS

  end

  def lose_dogs(i)
    @dogs -= i
  end

  def health
    if @hypothermia == false
      puts "You are warm enough...for now."
    else
      puts "You are beginning to freeze to death."
    end
  end

  def show_status
    count_meds
    count_dogs
    health
  end


end
