module Dota
  module API
    class PlayerOfficialInfo < Entity
      def name
        raw["Name"]
      end

      def team_name
        raw["TeamName"]
      end

      def team_tag
        raw["TeamTag"]
      end

      def sponsor
        raw["Sponsor"]
      end

      def fantasy_role
        raw["FantasyRole"]
      end

      def full_name
        [team_tag, name, sponsor].select { |a| !a.empty? }.join "."
      end
    end
  end
end
