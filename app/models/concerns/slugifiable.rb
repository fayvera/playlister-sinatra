
module Slugifiable
    module InstanceMethods

        def slug 
            # artist_name = self.name 
            slug = self.name.downcase.strip.gsub(" ", "-").gsub(/[^\w-]/, " ")           
        end
    end

    module ClassMethods

        def format_beginning

        end

        def find_by_slug(slug)
            # @slug = slug
            # @slug.

        end
    end
end

        # def find_by_slug(slug)
        #      @slug = slug
        #     format_slug_beginning
        #     results = self.where("name LIKE ?", @short_slug)
        #     results.detect do |result|
        #         result.slug === @slug
        #     end
        #  end

        #  def format_slug_beginning
        #     slug_beginning = @slug.split("-")[0]
        #     slug_beginning.prepend("%")
        #     slug_beginning.push("%")
        #     @short_slug = slug_beginning
        #  end