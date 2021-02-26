class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    # extend Slugifiable::ClassMethods
    # include Slugifiable::InstanceMethods

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