class AboutController < ApplicationController
  before_action :pundit_policy_scoped?, only: :index

  def index; end

  private

  def pundit_policy_scoped?
    true
  end
end
