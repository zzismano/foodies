class UserPolicy < ApplicationPolicy
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

  def create_post?
    true
  end

  def list?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end
end
