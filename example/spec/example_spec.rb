RSpec.describe "Example" do
  it "passes" do
    expect(1 + 1).to eq(2)
  end

  it "fails" do
    expect(1 + 1).to eq(3)
  end

  xit "is pending" do
    expect(1 + 1).to eq(2)
  end
end
