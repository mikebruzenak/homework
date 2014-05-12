here = File.expand_path(File.dirname(__FILE__))
require "#{here}/permission"
require "#{here}/organization"
require "#{here}/user"

class RoleOrganizer
  attr_accessor :roles_for_user

  def initialize(user)
    permissions = Permission.find_by_user_id(user.id)
    @roles_for_user = {}
    permissions.each do |p|
      @roles_for_user[p.org_id]=p.role
    end
  end

  def role_for_org(org)
    raise 'Organization nil' unless org
    role = @roles_for_user[org.id]
    return role if role
    loop do
      org = org.find_parent
      role = @roles_for_user[org.id] if org
      return role if role
      break if not org or org.is_root?
    end
    return :unassigned
  end
end
