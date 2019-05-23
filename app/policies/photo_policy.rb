class PhotoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show
    true
  end

  def create?
    user_is_owner? || user_is_admin?
  end

  def destroy?
    user_is_owner? || user_is_admin?
  end

  private

  def user_is_owner?
    record.user == user
  end

  def user_is_admin?
    user.admin
  end
end
