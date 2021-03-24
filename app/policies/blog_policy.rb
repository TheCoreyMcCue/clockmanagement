class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    user.admin?
  end

  def index?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def new?
    true
  end

  def create?
    user.admin? || user.blogger?
  end

  def show?
    true
  end
end
