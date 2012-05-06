require 'spec_helper'

describe Event do

  it { should have_one(:game) }

  it { should belong_to(:user) }

  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:desc).of_type(:string) }
  it { should have_db_column(:type).of_type(:string) }
  it { should have_db_column(:start_date).of_type(:datetime) }
  it { should have_db_column(:finish_date).of_type(:datetime) }
  it { should have_db_column(:author_id).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

end