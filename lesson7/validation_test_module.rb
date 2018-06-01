module ValidationTest
  def valid?
    validate!
    true
  rescue
    false
  end
end
