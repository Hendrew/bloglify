# frozen_string_literal: true

module Backoffice
  class BaseController < ApplicationController
    before_action :authenticate_user!

    layout "backoffice/application"
  end
end
