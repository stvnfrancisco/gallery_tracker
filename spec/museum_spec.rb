require('spec_helper')

describe(Museum) do
  describe(".all") do
    it("starts off with no museums") do
      expect(Museum.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you the museums name") do
      museum = Museum.new({:name => "Portland Art Museum", :id => nil})
      expect(museum.name()).to(eq("Portland Art Museum"))
    end
  end

  describe("#id") do
    it("sets the museums ID when you save it") do
      museum = Museum.new({:name => "Portland Art Museum", :id => nil})
      museum.save()
      expect(museum.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save museums to the database") do
      museum = Museum.new({:name => "Portland Art Museum", :id => nil})
      museum.save()
      expect(Museum.all()).to(eq([museum]))
    end
  end

  describe("#==") do
    it("is the same museum if it has the same name") do
      museum1 = Museum.new({:name => "Portland Art Museum", :id => nil})
      museum2 = Museum.new({:name => "Portland Art Museum", :id => nil})
      expect(museum1).to(eq(museum2))
    end
  end

  describe(".find") do
      it("returns a museum by its ID") do
        test_museum = Museum.new({:name => "Portland Ar Museum", :id => nil})
        test_museum.save()
        test_museum2 = Museum.new({:name => "MoMA", :id => nil})
        test_museum2.save()
        expect(Museum.find(test_museum2.id())).to(eq(test_museum2))
      end
  end

  describe("#artworks") do
    it("returns an array of artworks for that museum") do
      test_museum = Museum.new({:name => "MoMA", :id => nil})
      test_museum.save()
      test_artwork = Artwork.new({:name => "Campbells Soup Can", :museum_id => test_museum.id()})
      test_artwork.save()
      test_artwork2 = Artwork.new({:name => "On the Balcony", :museum_id => test_museum.id()})
      test_artwork2.save()
      expect(test_museum.artworks()).to(eq([test_artwork, test_artwork2]))
    end
  end
end
