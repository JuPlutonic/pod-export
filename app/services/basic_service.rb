# :reek:ModuleInitialize
module BasicService
  module ClassMethods
    def call(*args)
      new(*args).call
    end
  end

  # Why not using include/included for mixin?
  #   1) no need in more complex base.send in the hook
  #   2) we controlls order in initialize/#call with super (as prepended methods are come 1st)
  def self.prepended(base)
    # See https://dry-rb.org/gems/dry-initializer/3.0/skip-undefined/
    #   1) standard errors are easier to work with than Dry::undef.
    #   2) speedups work
    base.extend Dry::Initializer[undefined: false]
    base.extend ClassMethods
  end

  attr_reader :errors

  def initialize(*args)
    super(*args) # reek, U're bind
    @errors = []
  end

  def call
    super
    self
  end

  def failure?
    @errors.any?
  end

  def success?
    !failure?
  end

  private

  def fail!(messages)
    @errors += Array(messages)
    self
  end
end
