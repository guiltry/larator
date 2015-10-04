require 'spec_helper'

describe Larator::Generators::Base do
  it 'has a correct operation_name' do
    expect(Larator::Generators::Base.operation_name).to eq "base"
  end
end

