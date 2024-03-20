class QuizPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.active
      end
    end
  end
end
