require('spec_helper')

describe(Artwork) do
  describe(".all") do
    it("is empty at first") do
      expect(Artwork.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds an artwork to the array of saved artworks") do
     test_artwork = Artwork.new({:name => "Campbells Soup Can", :museum_id => 1})
     test_artwork.save()
     expect(Artwork.all()).to(eq([test_artwork]))
    end
  end

  describe("#name") do
    it("lets you read the name out") do
      test_artwork = Artwork.new({:name => "Campbells Soup Can", :museum_id => 1})
      expect(test_artwork.name()).to(eq("Campbells Soup Can"))
    end
  end

  describe("#museum_id") do
    it("lets you read the museum ID out") do
      test_artwork = Artwork.new({:name => "Campbells Soup Can", :museum_id => 1})
      expect(test_artwork.museum_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same artwork if it has the same name") do
      artwork1 = Artwork.new({:name => "Campbells Soup Can", :museum_id => 1})
      artwork2 = Artwork.new({:name => "Campbells Soup Can", :museum_id => 1})
      expect(artwork1).to(eq(artwork2))
    end
  end
end
