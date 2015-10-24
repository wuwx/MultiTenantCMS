class UserPolicy < ApplicationPolicy

  def destroy?
    user.admin?
  end

  def update?
    user.admin?
  end

  def create?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
