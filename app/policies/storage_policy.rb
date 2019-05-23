class StoragePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
   true
  end

  def create?
   true
  end

  def show?
    true
  end

  def edit?
    # record -> storage
    # user -> current_user
    # @storage.user == current_user
    user_is_owner? || user_is_admin?
  end

  def update?
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
