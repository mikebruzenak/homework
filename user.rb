here = File.expand_path(File.dirname(__FILE__))
require "#{here}/stub_db"

class User
  attr_accessor :id, :name

  def initialize( lid, lname )
    @id = lid
    @name = lname
  end

  def self.all
    p = []
    StubDB.users.each_pair do |key, value|
      p << User.new(key, value[:name])
    end
    p
  end

  def self.find(id)
    value = StubDB.users[id]
    return User.new(id, value[:name]) if value
    nil
  end

  def self.find_by_name(name)
    StubDB.users.each_pair do |key, value|
      return self.new(key, value[:name]) if value[:name] == name
    end
    nil
  end

end



