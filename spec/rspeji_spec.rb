require "spec_helper"
require "open3"

RSpec.describe "Rspeji formatter" do
  let(:example_dir) { File.expand_path("../example", __dir__) }

  before(:all) do
    Dir.chdir(File.expand_path("../example", __dir__)) do
      system("bundle install --quiet")
    end
  end

  def run_example_specs(env: {})
    Dir.chdir(example_dir) do
      Open3.capture2e(env.merge("EMOJI_SPEC" => "cats"), "bundle", "exec", "rspec")
    end
  end

  it "outputs emoji for passed, failed, and pending examples" do
    output, _status = run_example_specs
    expect(output).to include("😸 ")  # passed
    expect(output).to include("😾 ")  # failed
    expect(output).to include("🙀 ")  # pending
  end

  it "displays the Rspeji header" do
    output, _status = run_example_specs
    expect(output).to include("Using Rspeji with cats")
  end

  it "reports pending examples" do
    output, _status = run_example_specs
    expect(output).to include("PENDING:")
  end

  it "reports failing examples" do
    output, _status = run_example_specs
    expect(output).to include("FAILING:")
  end
end
