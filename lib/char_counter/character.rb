module CharCounter
  class Character
    def self.count
      string = new(ARGV)
      string.count
    end

    def initialize(arg)
      @arg = arg.first
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
                
      p "The least frequence char is #{sort_output_array.first.last.chr}"
      p "The most frequence char is #{sort_output_array.last.last.chr}"
    end
  end
end