require "rspec"
require "spec_helper"

describe Game do

  it { should belong_to(:event) }
  it { should belong_to(:project_format) }

  it { should have_db_column(:event_id).of_type(:integer) }
  it { should have_db_column(:format_id).of_type(:integer) }
  it { should have_db_column(:number).of_type(:integer) }
  it { should have_db_column(:legend).of_type(:text) }
  it { should have_db_column(:prequel).of_type(:text) }
  it { should have_db_column(:price).of_type(:integer) }
  it { should have_db_column(:area).of_type(:string) }
  it { should have_db_column(:brief_place).of_type(:string) }
  it { should have_db_column(:team_list).of_type(:string) }
  it { should have_db_column(:dopy_list).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should have_db_index(:event_id).unique(true) }

  it { should validate_presence_of(:event) }
  it { should validate_presence_of(:project_format) }

  describe "provides project" do
    before :all do
      @game = FactoryGirl.create(:game)
      @format = @game.project_format
    end
    after :all do
      Game.delete_all
      ProjectFormat.delete_all
      Project.delete_all
    end

    it "success" do
      @game.project.should == @format.project
    end

  end

end