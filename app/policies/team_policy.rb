class TeamPolicy < ApplicationPolicy

  def create?
    return true
  end

  def show?
    return true
  end

  # def destroy?
  #   record.user == user
  # end

end
