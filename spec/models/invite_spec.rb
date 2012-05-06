require 'spec_helper'

describe Invite do

  it { should belong_to(:user) }
  it { should belong_to(:event) }

  it { should have_db_column(:event_id).of_type(:integer) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:state).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

end