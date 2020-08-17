require 'errors'
require 'sort_command'

RSpec.describe SortCommand do
  describe '#validate!' do
    subject(:command) { described_class.new(*args) }

    context 'is valid' do
      let(:args) { ['webserver.log'] }

      it 'does not raise error' do
        expect { command.validate! }.not_to raise_error
      end
    end

    context 'when no args' do
      let(:args) { [] }

      it 'raises error' do
        expect { command.validate! }.to raise_error NoArgsError
      end
    end

    context 'when too many args passed' do
      let(:args) { ['one', 'two'] }

      it 'raises error' do
        expect { command.validate! }.to raise_error TooManyArgsError
      end
    end

    context 'when file not found' do
      let(:args) { ['non-existent.log'] }

      it 'raises error' do
        expect { command.validate! }.to raise_error FileNotFoundError
      end
    end

    context 'when file is not a log' do
      let(:args) { ['webserver.txt'] }

      it 'raises error when file is not a log' do
        expect { command.validate! }.to raise_error IncorrectFileTypeError
      end
    end
  end
end
