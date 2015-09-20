require 'spec_helper'

describe TrainingExamples do

  let(:examples){TrainingExamples.new({path:'spec/training/'})}

  it 'p_apriori returns a decimal number less then one and greater or equal then zero' do
    expect(examples.p_apriori("I")).to be >= 0
    expect(examples.p_apriori("I")).to be < 1
    expect(examples.p_apriori("!I")).to be >= 0
    expect(examples.p_apriori("!I")).to be < 1
  end

  it 'p returns a decimal number equal greater then zero' do
    expect(examples.p("Blender", "I")).to be > 0
    expect(examples.p("Lorem", "I")).to be >= 0
  end

  it 'p returns a decimal number equal greater then zero' do
    expect(examples.p("Blender", "I")).to be > examples.p("Blender", "!I")
  end

  it 'p returns a decimal number less then one ' do
    expect(examples.p("Blender", "I")).to be < 1
  end

end
