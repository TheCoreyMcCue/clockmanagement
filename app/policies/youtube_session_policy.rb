class YoutubeSessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def callback?
    true
  end

  def auth_client?
    true
  end

  def redirect_uri?
    true
  end

  def verify_authorized?
    true
  end

end
