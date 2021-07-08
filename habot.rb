#!/usr/bin/env ruby
# coding: utf-8

require 'pp'

class Markov 
  ORDER_NUM = 2
	def initialize
    
		@word_list =[]
		@chain_list =[]
		@post
    File.open("wakati_tweet", "r") do |f|
      f.each_line do |line|
        tmp = line.chomp.split(" ")
        while not tmp.length < ORDER_NUM do 
          @chain_list << tmp[0..(ORDER_NUM-1)]
          tmp.delete_at(0)
        end
      end
    end

    #pp @chain_list
	end

	def make_chain(pre_steps)
    # そのうちn次のマルコフ連鎖にしたい
    near_list = @chain_list.select{|tuple| tuple[0]==pre_steps[0] }
		if near_list.length == 0 then 
			return pre_steps + [nil]
		end
    return near_list.sample
	end

	def generate_post
    post = ""
		first_word_list=["今日","天地","タレ","ブタ","生","麺","汁","こりゃ","豚","醤油"]
    now_word =  first_word_list.sample
    400.times do
			now_word, next_word = make_chain([now_word])
      post += now_word

      if next_word.nil? or now_word.include? "完飲" then
        break 
      end

      # next step
      now_word = next_word
		end
    post
	end
end



if $0 == __FILE__ then
  habot = Markov.new 
  puts habot.generate_post
end



