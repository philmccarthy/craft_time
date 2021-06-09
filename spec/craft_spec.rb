require 'spec_helper'
require './lib/craft'

RSpec.describe Craft do
  describe 'initialize' do
    it 'exists and has attributes' do
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      expect(sewing.name).to eq('sewing')
      expect(sewing.supplies_required).to eq({fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      
      expect(knitting.name).to eq('knitting')
      expect(knitting.supplies_required).to eq({yarn: 20, scissors: 1, knitting_needles: 2})
    end
  end
end
