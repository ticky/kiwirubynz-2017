class BadEmojiFormatter
  RSpec::Core::Formatters.register self,
                                   :start,
                                   :stop,
                                   :example_started,
                                   :example_failed,
                                   :example_passed

  def initialize(output)
    @output = output
    @total = 0
    @passed = 0
    @failed = 0
    @pending = 0
  end

  def update
    unknown_count = @total - @passed - @failed - @pending

    passed_bits = '✅ ' * @passed
    pending_bits = '🔎 ' * @pending
    unknown_bits = '❔ ' * unknown_count
    failed_bits = '❌ ' * @failed

    @output.write "\r#{passed_bits}#{pending_bits}#{unknown_bits}#{failed_bits}"
  end

  def start(notification)
    @total = notification.count
  end

  def stop(notification)
    @output.puts
  end

  def method_missing(method, _args)
    case method
    when :example_started
      @pending += 1
    when :example_failed
      @pending -= 1
      @failed += 1
    when :example_passed
      @pending -= 1
      @passed += 1
    end

    update
  end
end
