require 'spec_helper'
describe 'elasticsearch_reporter' do
  context 'with default values for all parameters' do
    it { should contain_class('elasticsearch_reporter') }
  end
end
