class SitePolicy < ApplicationPolicy

  def update?
    return false unless user
    record.user === user || user.admin?
  end

  def destroy?
    user.admin?
  end

  def create?
    user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
