module CharCounter
  class Character
    def self.count()
      raise ArgumentError.new("Missing Input String") unless ARGV.size > 0
      string = new(ARGV)
      string.count
    end

    def initialize(arg)
      @arg = arg.first.gsub(" ","")
      raise RuntimeError.new("Can't accept special characters") if @arg =~ /\W/
      @characters = Hash.new(0)
    end

    def count
      p "Input string is #{@arg}"
      @arg.each_byte.each {|ch| @characters[ch] += 1}
      
      p "Characters statistics:"
      output = {}
      @characters.each do |code_point, freq| 
        puts "#{code_point.chr} occurs #{freq} times"
        output[freq] = code_point if output[freq].nil? or code_point < output[freq]
      end

      sort_output_array = output.sort_by {|freq, code_point| freq}
      least_frequent= sort_output_array.first.last.chr
      most_frequent  = sort_output_array.last.last.chr          
      p "The least frequence char is #{least_frequent}"
      p "The most frequence char is #{most_frequent}"
      return [most_frequent, least_frequent]
    end
  end
end