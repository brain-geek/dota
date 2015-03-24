describe Dota::API::PlayerOfficialInfo do
  let(:info) do
    VCR.use_cassette("GetPlayerOfficialInfo") do
      test_client.player_official_info(dendi_account_id)
    end
  end

  specify "#name" do
    expect(info.name).to eq "Dendi"
  end

  specify "#team_name" do
    expect(info.team_name).to eq "Natus Vincere"
  end

  specify "#team_tag" do
    expect(info.team_tag).to eq "Na`Vi"
  end

  specify "#sponsor" do
    expect(info.sponsor).to eq "DCE"
  end

  specify "#fantasy_role" do
    expect(info.fantasy_role).to eq 1
  end

  describe "#full_name" do
    it "get full name" do
      expect(info.full_name).to eq "Na`Vi.Dendi.DCE"
    end

    it "empty sponsor" do
      allow(info).to receive(:sponsor).and_return ""
      expect(info.full_name).to eq "Na`Vi.Dendi"
    end

    it "empty team_tag" do
      allow(info).to receive(:team_tag).and_return ""
      expect(info.full_name).to eq "Dendi.DCE"
    end
  end

end
