class Authorization
  def self.before(controller)
    self.current_owner(controller.current_owner)
  end

  def self.current_owner(current_owner=nil)
    raise CurrentOwnerError unless current_owner
  end
end