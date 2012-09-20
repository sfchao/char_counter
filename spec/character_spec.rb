require 'spec_helper'

describe CharCounter::Character do
  context "Missing Argument" do
    it "should raise ArgumentError" do
      expect{ CharCounter::Character.count }.to raise_error(ArgumentError)
    end
  end

  context "Speicall character as input" do
    it "should raise error" do
      ARGV = ["#d#"]      
      expect{ CharCounter::Character.count }.to raise_error(RuntimeError)
    end
  end

  context "Input string: aaabbcccd" do
    before(:each) do
      ARGV = ["aaabbcccd"]
      @most, @least = CharCounter::Character.count
    end
    it "should have 'a' for most frequently char" do
      @most.should == "a"
    end
    it "should have 'd' for least frequently char" do
      @least.should == "d"
    end
  end

  context "Input String: zzzzzabbbdA" do
    before(:each) do
      ARGV = ["zzzzzabbbdA"]
      @most, @least = CharCounter::Character.count
    end
    it "should have 'z' for most frequently char" do
      @most.should == "z"
    end

    it "should have 'A' for least frequently char" do
      @least.should == "A"
    end
  end

  context "Input String: 'zz xxx yyyy wwww rrrr" do
    before(:each) do
      ARGV = ["zz xxx yyyy wwww rrrr"]
      @most, @least = CharCounter::Character.count
    end
    it "should have 'w' for most frequently char" do
      @most.should == "r"
    end

    it "should have 'z' for least frequently char" do
      @least.should == "z"
    end
  end
end