require('spec_helper')

describe(Artwork) do
  describe(".all") do
    it("is empty at first") do
      expect(Artwork.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds an artwork to the array of saved artworks") do
     test_artwork = Artwork.new({:description => "Campbells Soup Can", :museum_id => 1})
     test_artwork.save()
     expect(Artwork.all()).to(eq([test_artwork]))
    end
  end

  describe("#description") do
    it("lets you read the description out") do
      test_artwork = Artwork.new({:description => "Campbells Soup Can", :museum_id => 1})
      expect(test_artwork.description()).to(eq("Campbells Soup Can"))
    end
  end

  describe("#museum_id") do
    it("lets you read the museum ID out") do
      test_artwork = Artwork.new({:description => "Campbells Soup Can", :museum_id => 1})
      expect(test_artwork.museum_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same artwork if it has the same name") do
      artwork1 = Artwork.new({:description => "Campbells Soup Can", :museum_id => 1})
      artwork2 = Artwork.new({:description => "Campbells Soup Can", :museum_id => 1})
      expect(artwork1).to(eq(artwork2))
    end
  end

  describe("#delete") do
    it("lets you delete artworks from museums") do
      artwork = Artwork.new({:description => "Melt Head", :museum_id => 1})
      artwork.save()
      artwork2 = Artwork.new({:description => "Something Else", :museum_id => 2})
      artwork2.save()
      artwork.delete()
      expect(Artwork.all()).to(eq([artwork2]))
    end
  end
end
