class SitePolicy < ApplicationPolicy

  def update?
    record.user && record.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
