require 'spec_helper'
require './lib/person'

RSpec.describe Person do
  describe 'initialize' do
    it 'exists and has attributes' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})

      expect(hector.name).to eq('Hector')
      expect(hector.interests).to eq(['sewing', 'millinery', 'drawing'])
      expect(hector.supplies).to eq({})
      
      expect(toni.name).to eq('Toni')
      expect(toni.interests).to eq(['sewing', 'knitting'])
      expect(toni.supplies).to eq({})
    end

    it '#add_supply and #can_build?' do
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      event = Event.new("Carla's Craft Connection", [sewing], [hector])

      expect(hector.supplies).to be_empty
      
      expect(hector.can_build?(sewing)).to eq(false)

      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)

      expect(hector.supplies).to eq({'fabric' => 7, 'thread' => 1})
      
      expect(hector.can_build?(sewing)).to eq(false)
      
      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)

      expect(hector.supplies).to eq({"fabric"=>7, "thread"=>1, "scissors"=>1, "sewing_needles"=>1})
      expect(hector.can_build?(sewing)).to eq(true)
    end
  end
end
