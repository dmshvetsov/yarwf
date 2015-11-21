class Object

  # Auto loading feature
  def self.const_missing(missed)
    loaded = require Yarwf.to_underscore(missed.to_s)
    Object.const_get(missed) if loaded
  end

end
