require 'rails_helper'

RSpec.describe Terminal, type: :model do
  context 'validation tests' do
    it 'ensures name is present' do
      terminal  = Terminal.new(description: 'test terminal', type: 'Console Type', operating_system: 'windows')
      expect(terminal.valid?).to eq(false)

      terminal  = Terminal.new(name: 'test terminal name')
      expect(terminal.valid?).to eq(true)
    end

    it 'should save successfully' do
      test_terminal = Terminal.new(name: 'test_terminal_1', description: 'test terminal', type: 'Console Type', operating_system: 'windows' ).save
      expect(test_terminal).to eq(true)

      test_terminal = Terminal.new(name: 'test_terminal_2', description: 'test terminal').save
      expect(test_terminal).to eq(true)
    end

  end

  context 'terminal_attributes' do
    let(:params) { {name: 'test_terminal', description: 'testing terminal'} }
    before(:each) do
      @terminal = Terminal.new(params)
    end

    it 'should return hash' do
      terminal_attributes = {'type' => 'Console Terminal', 'operating_system' => 'Linux'}
      @terminal.terminal_attributes = terminal_attributes

      expect(@terminal.save).to eq(true)
      expect(Terminal.last.terminal_attributes).to eq(terminal_attributes)
    end

    it 'should let access sub attributes directly' do
      @terminal.terminal_attributes = {'type' => 'Console Terminal', 'operating_system' => 'Linux'}
      @terminal.save

      expect(Terminal.last.terminal_attributes['type']).to eq(Terminal.last.type)
      expect(Terminal.last.terminal_attributes['operating_system']).to eq(Terminal.last.operating_system)
    end
  end
end
