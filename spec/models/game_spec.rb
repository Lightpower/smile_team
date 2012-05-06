require "rspec"

describe Game do

  it { should belong_to(:event) }

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

end