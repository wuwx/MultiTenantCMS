class CustomFieldPolicy < ApplicationPolicy

  def create?
    record.site.user === user || user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
