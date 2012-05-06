require 'spec_helper'

describe ProjectFormat do

  it { should have_many(:games) }
  it { should belong_to(:project) }

  it { should have_db_column(:name).of_type(:string).with_options(unique: true) }
  it { should have_db_column(:project_id).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should have_db_index(:name).unique(true) }

end