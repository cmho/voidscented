require 'sinatra'
require 'open-uri'
require 'markov_chains'

get '/' do
	data = open('https://dl.dropboxusercontent.com/u/2258962/voidscented.txt') { |io| io.read }
	generator = MarkovChains::Generator.new(data, 2)
	text = generator.get_sentences(3).join("<br />")
	erb text
end