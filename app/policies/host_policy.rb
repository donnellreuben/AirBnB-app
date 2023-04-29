class HostPolicy < ApplicationPolicy
  def index?
    user.host?
  end

  def new?
    user.host?
  end

  def show?
    user.host?
  end

  def create?
    user.host?
  end

  def update?
    user.host?
  end

  def destroy?
    user.host?
  end
end
