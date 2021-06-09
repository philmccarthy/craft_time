require 'spec_helper'
require './lib/event'

RSpec.describe Event do
  describe 'initialize' do
    it 'exists and has attributes' do
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      
      expect(event.name).to eq("Carla's Craft Connection")
      expect(event.people).to eq([hector, toni])
      expect(event.crafts).to eq([sewing, knitting])
      expect(event.attendee_names).to eq(["Hector", "Toni"])
      expect(event.craft_with_most_supplies).to eq('sewing')
      expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end

    it 'attendees_by_craft_interest' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])

      expected = {
        "knitting" => [toni, tony],
        "painting" => [],
        "sewing" => [hector, toni]
      }

      actual = event.attendees_by_craft_interest

      expect(actual).to eq(expected)
    end

    it 'crafts_that_use' do
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])

      expect(event.crafts_that_use('scissors')).to eq([knitting, sewing])
      expect(event.crafts_that_use('fire')).to eq([])
    end
  end
end
