class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.includes(:planet).where(user_id: user.id, planets: { bought: true })
    end
  end

  def create?
    true
  end
end
