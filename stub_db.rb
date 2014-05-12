module StubDB
  extend self
  attr_accessor :permissions, :permissions_auto_index,
                :organizations, :organizations_auto_index,
                :users, :users_auto_index,
                :johns_roles, :joes_roles, :ricks_roles

  @permissions = {
      1 => {user_id: 1, org_id: 2, role: :admin},
      2 => {user_id: 1, org_id: 7, role: :denied},
      3 => {user_id: 2, org_id: 1, role: :admin},
      4 => {user_id: 2, org_id: 4, role: :user},
      5 => {user_id: 2, org_id: 2, role: :admin},
      6 => {user_id: 2, org_id: 9, role: :denied}
  }
  @permissions_auto_index = @permissions.length + 1

  @organizations = {
      1 => {name: 'Root'},
      2 => {name: 'Org 1', parent_id: 1},
      3 => {name: 'Org 2', parent_id: 1},
      4 => {name: 'Org 3', parent_id: 1},
      5 => {name: 'Org 4', parent_id: 1},
      6 => {name: 'Child Org 1', parent_id: 2},
      7 => {name: 'Child Org 2', parent_id: 2},
      8 => {name: 'Child Org 3', parent_id: 4},
      9 => {name: 'Child Org 4', parent_id: 4}
  }
  @organizations_auto_index = @organizations.length + 1

  @users = {
      1 => {name: 'John'},
      2 => {name: 'Joe'},
      3 => {name: 'Rick'},
      4 => {name: 'Anthony'},
      5 => {name: 'Tim'}
  }
  @users_auto_index = @users.length + 1

  @johns_roles = [
      :unassigned,
      :admin,
      :unassigned,
      :unassigned,
      :unassigned,
      :admin,
      :denied,
      :unassigned,
      :unassigned  ]

  @joes_roles = [
      :admin,
      :admin,
      :admin,
      :user,
      :admin,
      :admin,
      :admin,
      :user,
      :denied
  ]

  @ricks_roles = [
      :unassigned,
      :unassigned,
      :unassigned,
      :unassigned,
      :unassigned,
      :unassigned,
      :unassigned,
      :unassigned,
      :unassigned
  ]

end