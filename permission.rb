here = File.expand_path(File.dirname(__FILE__))
require "#{here}/stub_db"

class Permission
  attr_accessor :id, :user_id, :org_id, :role

  def initialize( lid, luser_id, lorg_id, lrole )
    @id = lid
    @user_id = luser_id
    @org_id = lorg_id
    @role = lrole
  end

  def self.all
    p = []
    StubDB.permissions.each_pair do |key, value|
      p << self.new(key, value[:user_id], value[:org_id], value[:role])
    end
    p
  end

  def self.find( id )
    value = StubDB.permissions[id]
    return self.new(id, value[:user_id], value[:org_id], value[:role]) if value
    nil
  end

  def self.find_by_user_id( uid )
    p = []
    StubDB.permissions.each_pair do |key, value|
      p << self.new(key, value[:user_id], value[:org_id], value[:role]) if value[:user_id] == uid
    end
    p
  end

end
