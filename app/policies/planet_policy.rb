class PlanetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all.order(created_at: :desc)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
