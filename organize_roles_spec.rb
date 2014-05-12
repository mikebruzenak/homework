require 'rspec'
here = File.expand_path(File.dirname(__FILE__))
require "#{here}/permission"
require "#{here}/organization"
require "#{here}/user"
require "#{here}/role_organizer"
require "#{here}/stub_db"

# Uses StubDB singleton test data description. 

describe 'RoleOrganizer' do
  context 'when initialized with user John' do
    let(:user) { User.find_by_name 'John' }
    let(:role_organizer) { RoleOrganizer.new user }
    it 'should find two roles' do
      role_organizer.roles_for_user.length.should == 2
    end
    it 'should match johns expected roles' do
      roles = []
      (1..9).each do |n|
        org = Organization.find(n)
        roles << role_organizer.role_for_org(org)
      end
      roles.should == StubDB.johns_roles
    end
  end

  context 'when initialized with user Joe' do
    let(:user) { User.find_by_name 'Joe' }
    let(:role_organizer) { RoleOrganizer.new user }
    it 'should find two roles' do
      role_organizer.roles_for_user.length.should == 4
    end
    it 'should match Joes expected roles' do
      roles = []
      (1..9).each do |n|
        org = Organization.find(n)
        roles << role_organizer.role_for_org(org)
      end
      roles.should == StubDB.joes_roles
    end
  end

  context 'when initialized with user Rick' do
    let(:user) { User.find_by_name 'Rick' }
    let(:role_organizer) { RoleOrganizer.new user }
    it 'should not find any roles' do
      role_organizer.roles_for_user.length.should == 0
    end
    it 'should match Ricks expected roles' do
      roles = []
      (1..9).each do |n|
        org = Organization.find(n)
        roles << role_organizer.role_for_org(org)
      end
      roles.should == StubDB.ricks_roles
    end
  end

end