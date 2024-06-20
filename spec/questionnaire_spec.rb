require 'pstore'
require_relative '../questionnaire'

RSpec.describe 'Questionnaire' do
  let(:store) { PStore.new('test.pstore') }

  before do
    store.transaction do
      store[:all_runs] = []
    end
  end

  after do
    File.delete('test.pstore') if File.exist?('test.pstore')
  end

  describe '#do_prompt' do
    it 'collects user responses and stores them' do
      allow_any_instance_of(Object).to receive(:gets).and_return('yes', 'no', 'y', 'n', 'yes')
      do_prompt(store)
      store.transaction(true) do
        all_runs = store[:all_runs]
        expect(all_runs.size).to eq(1)
        expect(all_runs.first).to eq({
          "q1" => true,
          "q2" => false,
          "q3" => true,
          "q4" => false,
          "q5" => true
        })
      end
    end
  end


end
