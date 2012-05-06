require 'spec_helper'

describe Project do

  it { should have_many(:project_formats) }

  it { should have_db_column(:name).of_type(:string).with_options(unique: true) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should have_db_index(:name).unique(true) }

end