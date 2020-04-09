require 'spec_helper'
require 'dentaku/flat_hash'

describe Dentaku::FlatHash do
  let(:expressions) do
    {
      string: 'foo',
      hash: {
        string: 'bar',
        number: 12,
        hash: {
          string: 'baz'
        },
        array: ['foo']
      },
      array: ['foo'],
      array_hash: [
        { string: 'foo' },
        { string: 'bar' },
        'baz',
      ]
    }
  end

  it 'flattens a hash with nested hashes and arrays' do
    flattened_hash = Dentaku::FlatHash.from_hash(expressions)
    expect(flattened_hash).to eq(
      :string => "foo",
      :"hash.string" => "bar",
      :"hash.number" => 12,
      :"hash.hash.string" => "baz",
      :"hash.array.0" => "foo",
      :"array.0" => "foo",
      :"array_hash.0.string" => "foo",
      :"array_hash.1.string" => "bar",
      :"array_hash.2" => "baz",
    )
  end
end
