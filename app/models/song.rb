class Song < ActiveRecord::Base
    has_many :song_genres
    belongs_to :artist
    has_many :genres, through: :song_genres
    # extend Slugifiable::ClassMethods
    # include Slugifiable::InstanceMethods

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by(:name => artist_name)
    end 

    def slug 
        slug = self.name.downcase.strip.gsub(" ", "-").gsub(/[^\w-]/, " ")           
    end
    def self.find_by_slug(slug)
        @slug = slug
        format_slug_beginning
        results = self.where("name LIKE ?", @short_slug)
        results.detect do |result|
            result.slug === @slug
        end
    end
    
    def self.format_slug_beginning
        slug_beginning = @slug.split("-")[0]
        slug_beginning.prepend("%")
        slug_beginning << "%"
        @short_slug = slug_beginning
     end
    # def self.find_by_slug(slug)
    #     Song.all.find { |song| song.slug == slug }
    # end
end