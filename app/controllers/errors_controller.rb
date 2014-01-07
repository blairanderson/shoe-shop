class ErrorsController < ApplicationController
  def not_found
    logger.error env["action_dispatch.exception"]
  end

  def error
    logger.error env["action_dispatch.exception"]
  end
end