class Context

  # Context.new( context_text, options )
  def initialize
    @context = "Your dreams are interrupted by the beeping of the radio. It's not yet dawn--a message at this hour can only bring ill news."

    @options = %{
a) Dress yourself and your dogs. This will take the most time, and you might get caught in the storm.
b) Dress only yourself. Some of the dogs may suffer frostbite, but if you die who will tell them where to go?
c) Dress the dogs. You wouldn't survive long without them anyway.
}
  end

  def to_s
<<-HEREDOC
  #{@context}

  #{@options}
HEREDOC
  end

end
