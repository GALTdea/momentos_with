class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def index?
      user.admin?
    end
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
