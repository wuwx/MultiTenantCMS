class CommentPolicy < ApplicationPolicy

  def update?
    record.user === user
  end

  def create?
    record.site.user === user
  end

  def destroy?
    record.site.user === user || user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
