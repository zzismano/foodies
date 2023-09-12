class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def follow?
    true
  end

  def unfollow?
    true
  end

  def accept?
    true
  end

  def decline?
    true
  end

  def cancel?
    true
  end

  def list?
    true
  end

end
