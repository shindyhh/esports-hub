class LikePolicy < ApplicationPolicy

  def create?
    return true
  end

  def destroy?
    record.user == user
  end

end
