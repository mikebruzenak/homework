require 'rspec'
here = File.expand_path(File.dirname(__FILE__))
require "#{here}/permission"
require "#{here}/organization"
require "#{here}/user"
require "#{here}/role_organizer"
require "#{here}/stub_db"

describe 'organization model function' do
  context 'when organization is Root' do
    let(:org) { Organization.find_by_name 'Root' }
    it "should find all second level organizations as it's children" do
      org.child_organizations.length.should == 4
    end
  end
  context 'when organization is Org 1' do
    let(:org) { Organization.find_by_name 'Org 1' }
    it "should find all second level organizations as it's children" do
      org.child_organizations.length.should == 2
    end
  end
end