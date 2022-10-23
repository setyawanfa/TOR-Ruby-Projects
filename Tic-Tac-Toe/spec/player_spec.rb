# frozen_string_literal: TrueClass

require_relative('../lib/Player')

describe Player do
  subject(:player) { described_class.new('alan', 'x') }

  it 'check player name is alan' do
    expect(player.name).to eql('alan')
  end

  it 'check player sign is x' do
    expect(player.sign).to eql('x')
  end
end
