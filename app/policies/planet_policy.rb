class PlanetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where.not(bought: true).order(created_at: :desc)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    record.user == user || user.orders.where(planet_id: record.id).exists?
  end

  def update?
    record.user == user || user.orders.where(planet_id: record.id).exists?
  end

  def destroy?
    record.user == user || user.orders.where(planet_id: record.id).exists?
  end

  def order?
    user.orders.where(planet_id: record.id).exists?
  end
end
