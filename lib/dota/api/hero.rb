module Dota
  module API
    class Hero
      attr_reader :id, :name

      def self.all
        @all ||= mapping.keys.map { |id| new(id) }
      end

      def initialize(id)
        @id = id
        @internal_name = self.class.mapping[id][0]
        @name = self.class.mapping[id][1]
      end

      def image_url(type = :full)
        "http://cdn.dota2.com/apps/dota2/images/heroes/#{internal_name}_#{type}.png"
      end

      private

      def self.mapping
        path = File.join(Gem::Specification.find_by_name('dota').gem_dir, 'data', 'heroes.yml')
        @mapping ||= YAML.load_file(path).freeze
      end

      attr_reader :internal_name
    end
  end
end
