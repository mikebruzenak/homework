here = File.expand_path(File.dirname(__FILE__))
require "#{here}/stub_db"

class Organization
  attr_accessor :id, :name, :parent_id

  def initialize(lid, lname, lparent_id)
    @id = lid
    @name = lname
    @parent_id = lparent_id
  end

  def self.map_stub( key, value )
    self.new(key, value[:name], value[:parent_id])
  end

  def self.all
    p = []
    StubDB.organizations.each_pair do |key, value|
      p << self.new(key, value[:name], value[:parent_id])
    end
    p
  end

  def self.find(id)
    value = StubDB.organizations[id]
    return self.new(id, value[:name], value[:parent_id]) if value
    nil
  end

  def self.find_by_name(name)
    StubDB.organizations.each_pair do |key, value|
      return self.map_stub(key, value) if value[:name] == name
    end
    nil
  end

  def self.find_by_parent_id(pid)
    org = StubDB.organizations[pid]
    return self.new(pid, org[:name], org[:parent_id]) if org
    nil
  end

  def find_parent
    self.class.find_by_parent_id(parent_id)
  end

  def is_root?
    not parent_id
  end

  def child_organizations
    p = []
    StubDB.organizations.each_pair do |key, value|
      p << self.class.map_stub(key, value) if value[:parent_id] == id
    end
    p
  end

end


