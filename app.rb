require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/dice/:dice/:sides") do
  @dice = params[:dice].to_i
  @sides = params[:sides].to_i
  @rolls = Array.new(@dice) { rand(1..@sides) }
  @heading_text = "#{@dice}d#{@sides}" # Change here to match expected format
  erb(:randomdice)
end

get("/dice/2/6") do
  @rolls = Array.new(2) { rand(1..6) }
  @heading_text = "2d6" # Change here to match expected format
  erb(:two_six)
end

get("/dice/2/10") do
  @rolls = Array.new(2) { rand(1..10) }
  @heading_text = "2d10" # Change here to match expected format
  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = Array.new(1) { rand(1..20) }
  @heading_text = "1d20" # Change here to match expected format
  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = Array.new(5) { rand(1..4) }
  @heading_text = "5d4" # Change here to match expected format
  erb(:five_four)
end

get("/dynamic/:number_of_dice/:how_many_sides") do
  @num_dice = params.fetch("number_of_dice").to_i
  @sides = params.fetch("how_many_sides").to_i
  @rolls = Array.new(@num_dice) { rand(1..@sides) }
  @heading_text = "#{@num_dice}d#{@sides}" # Change here to match expected format
  erb(:flexible)
end

get("/dice/[RANDOM_DICE]/[RANDOM_SIDES]") do
  random_dice = rand(2..100)
  random_sides = rand(2..100)
  @rolls = Array.new(random_dice) { rand(1..random_sides) }
  @heading_text = "#{random_dice}d#{random_sides}" # Change here to match expected format
  erb(:randomdice)
end
