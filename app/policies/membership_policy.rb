class MembershipPolicy < ApplicationPolicy

  def create?
    return true
  end
end
