require 'app'

RSpec.describe 'running command' do
  let(:log_file_path) { 'spec/support/fixtures/full-example.log' }
  let(:txt_file_path) { 'spec/support/fixtures/incorrect-type.txt' }

  let(:expected) do
    "Total visits\n"\
    "	/about/2 90 total visits\n"\
    "	/contact 89 total visits\n"\
    "	/index 82 total visits\n"\
    "	/about 81 total visits\n"\
    "	/help_page/1 80 total visits\n"\
    "	/home 78 total visits\n"\
    "Unique visits\n"\
    "	/index 23 unique visits\n"\
    "	/home 23 unique visits\n"\
    "	/contact 23 unique visits\n"\
    "	/help_page/1 23 unique visits\n"\
    "	/about/2 22 unique visits\n"\
    "	/about 21 unique visits\n"\
  end

  it 'is successful with correct args' do
    expect { system("bin/sort-logs #{log_file_path}") }.to output(expected).to_stdout_from_any_process
  end

  it 'raises error when no args' do
    expect { system("bin/sort-logs") }.to output("NoArgsError\n").to_stdout_from_any_process
  end

  it 'raises error when too many args passed' do
    expect { system("bin/sort-logs #{log_file_path} #{log_file_path}") }.to output("TooManyArgsError\n").to_stdout_from_any_process
  end

  it 'raises error when file not found' do
    expect { system("bin/sort-logs non_existent.log") }.to output("FileNotFoundError\n").to_stdout_from_any_process
  end

  it 'raises error when file is not a log' do
    expect { system("bin/sort-logs #{txt_file_path}") }.to output("IncorrectFileTypeError\n").to_stdout_from_any_process
  end
end
