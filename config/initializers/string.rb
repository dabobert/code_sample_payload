class String
  def is_integer?
    /\A[-+]?\d+\z/ === self
  end

  def is_i?
    self.is_integer?
  end
end