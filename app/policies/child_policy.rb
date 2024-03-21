class ChildPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || record.user == user
  end
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all  # Admins can see all children
      else
        scope.where(user: user)  # Regular users can only see their own children
      end
    end
  end
end
