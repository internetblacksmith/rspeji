require "emoji"
class Rspeji
  RSpec::Core::Formatters.register self,
    :dump_pending,
    :dump_failures,
    :close,
    :dump_summary,
    :example_passed,
    :example_failed,
    :example_pending

  def initialize(output)
    @emoji = Emoji.new(ENV["EMOJI_SPEC"])
    @output = output
    @output << "Using Rspeji with #{@emoji.selected_set} and:\n"
    @output << "passed: #{@emoji.passed} / pending: #{@emoji.pending} / failed: #{@emoji.failed}\n"
  end

  def example_passed(notification)
    @output << @emoji.passed
  end

  def example_pending(notification)
    @output << @emoji.pending
  end

  def example_failed(notification)
    @output << @emoji.failed
  end

  def dump_summary(notification)
    @output << "\n\nFinished in #{RSpec::Core::Formatters::Helpers.format_duration(notification.duration)}."
  end

  def close(notification)
    @output << "\n"
  end

  def dump_pending(notification)
    if notification.pending_examples.length > 0
      @output << "\n\n#{RSpec::Core::Formatters::ConsoleCodes.wrap("PENDING:", :pending)}\n\t"
      @output << notification.pending_examples.map { |example| example.full_description + " - " + example.location }.join("\n\t")
    end
  end

  def dump_failures(notification)
    if notification.failed_examples.length > 0
      @output << "\n#{RSpec::Core::Formatters::ConsoleCodes.wrap("FAILING:", :failure)}\n\t"
      @output << failed_examples_output(notification)
    end
  end

  private

  # Loops through all of the failed examples and rebuilds the exception message
  def failed_examples_output(notification)
    failed_examples_output = notification.failed_examples.map do |example|
      failed_example_output example
    end
    build_examples_output(failed_examples_output)
  end

  # Joins all exception messages
  def build_examples_output(output)
    output.join("\n\n\t")
  end

  # Extracts the full_description, location and formats
  # the message of each example exception
  def failed_example_output(example)
    full_description = example.full_description
    location = example.location
    formatted_message = strip_message_from_whitespace(example.execution_result.exception.message)

    "#{full_description} - #{location} \n  #{formatted_message}"
  end

  # Removes whitespace from each of the exception message lines and reformats it
  def strip_message_from_whitespace(msg)
    msg.split("\n").map(&:strip).join("\n#{add_spaces(10)}")
  end

  def add_spaces(n)
    " " * n
  end
end
