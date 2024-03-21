class QuizPolicy < ApplicationPolicy

  def index?
    user.admin?
  end

  def show?
    true
  end

  def new?
    user.admin?
  end

  class Scope < Scope
    def resolve
      if user && user.admin?
        scope.all
      else
        scope.active
      end
    end
  end
end
