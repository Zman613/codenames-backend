class Room < ApplicationRecord
  has_many :cards
  has_many :users
  has_many :messages
  has_many :spy_messages
  has_secure_password
  validates :name, uniqueness: { case_sensitive: false }

  @@game = { 
    'game1' => ['blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'red', 'red', 'red', 'red', 'red', 'red', 'red', 'red', 'assassin', 'innocent', 'innocent', 'innocent', 'innocent', 'innocent', 'innocent', 'innocent'],
    'game2' => ['blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'red', 'red', 'red', 'red', 'red', 'red', 'red', 'red', 'red', 'assassin', 'innocent', 'innocent', 'innocent', 'innocent', 'innocent', 'innocent', 'innocent']
  }

  # upon initialization of room
  def brand_new_game
    game = @@game["game#{rand(2) + 1}"] #randomly chooses who gets the extra card
    game = game.sample(25) #randomizes the order of the array
    words = Word.all.sample(25).map{|word| word.word} #randomly takes 25 words from the word db
    turn = game.max_by {|i| game.count(i)} #finds most common element in array
    self.update(turn: turn, start: turn) #sets whos turn it is
    25.times { self.cards.create(word: words.shift, team: game.shift, clicked: false)}
  end

  def new_game
    game = @@game["game#{rand(2) + 1}"] #randomly chooses who gets the extra card
    game = game.sample(25) #randomizes the order of the array
    words = Word.all.sample(25).map{|word| word.word} #randomly takes 25 words from the word db
    turn = game.max_by {|i| game.count(i)} #finds most common element in array
    self.update(turn: turn, start: turn) #sets whos turn it is
    self.cards.each do |card| #updates cards to new deck
      card.update(word: words.shift, team: game.shift, clicked: false)
    end
  end
end
