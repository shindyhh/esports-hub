class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def destroy?
    record.user == user
  end

  def show?
    return true
  end

  def like?
    return true
  end
end
