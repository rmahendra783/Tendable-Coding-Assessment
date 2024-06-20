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


  describe '#calculate_rating' do
    it 'calculates the correct rating' do
      answers = { "q1" => true, "q2" => false, "q3" => true, "q4" => false, "q5" => true }
      expect(calculate_rating(answers)).to eq(60.0)
    end
  end

  describe '#calculate_average_rating' do
    it 'calculates the correct average rating' do
      store.transaction do
        store[:all_runs] << { "q1" => true, "q2" => false, "q3" => true, "q4" => false, "q5" => true } # 60%
        store[:all_runs] << { "q1" => false, "q2" => true, "q3" => false, "q4" => true, "q5" => false } # 40%
      end
      store.transaction(true) do
        all_runs = store[:all_runs]
        expect(calculate_average_rating(all_runs)).to eq(50.0)
      end
    end
  end
end
