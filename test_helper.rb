require 'minitest/autorun'
# access to parser.rb
require_relative '../parser'
require 'rspec/autorun'


describe LogAnalyzer do
  let(:log_file) { File.expand_path('data/webserver.log') }
  let(:analyzer) { LogAnalyzer.new(log_file) }
  describe '#most_page_visits' do
    it 'returns pages sorted by visit count in descending order' do
      expect(analyzer.most_page_visits).to eq([
        ["/contact/", 155], ["/products/3", 149], ["/home", 143], ["products/1", 142], ["/index", 141], ["/about", 141], ["/products/2", 129]
      ])
    end
  end

  describe '#most_unique_page_visits' do
    it 'returns pages sorted by unique visitor count in descending order' do
      expect(analyzer.most_unique_page_visits).to eq([["/home", 20], ["/contact/", 20], ["/index", 20], ["/about", 20], ["/products/3", 20], ["products/1", 20], ["/products/2", 20]])
    end
  end
end
