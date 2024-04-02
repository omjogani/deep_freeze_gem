# frozen_string_literal: true

RSpec.describe DeepFreeze do
  include DeepFreeze

  it "freezes strings" do
    string = "Hello World"
    deep_freeze(string)
    expect(string.frozen?).to be true
  end

  it "freezes numbers" do
    number = 42
    deep_freeze(number)
    expect(number.frozen?).to be true
  end

  it "freezes symbols" do
    sym = :my_symbol
    deep_freeze(sym)
    expect(sym.frozen?).to be true
  end

  it "freezes nil" do
    nil_obj = nil
    deep_freeze(nil_obj)
    expect(nil_obj.frozen?).to be true
  end

  it "freezes false boolean" do
    bool = false
    deep_freeze(bool)
    expect(bool.frozen?).to be true
  end

  it "freezes true boolean" do
    bool = true
    deep_freeze(bool)
    expect(bool.frozen?).to be true
  end

  it "freezes arrays" do
    array = ["Hello", "World", [1, 2, 3]]
    deep_freeze(array)
    expect(array.frozen?).to be true
    expect(array.all?(&:frozen?)).to be true
    expect(array.last.all?(&:frozen?)).to be true
  end

  it "freezes hashes" do
    hashes = { a: "hello", b: "world", c: { d: 42 } }
    deep_freeze(hashes)
    expect(hashes.frozen?).to be true
    expect(hashes.keys.all?(&:frozen?)).to be true
    expect(hashes.values.all?(&:frozen?)).to be true
  end

  it "Raise an error when can't provide supported types" do
    obj = Object.new
    expect { deep_freeze(obj) }.to raise_error(RuntimeError)
  end
end
