class ProfilePolicy < ApplicationPolicy
  def show?
    user.profile == record
  end

  def update?
    user.profile == record
  end
end
