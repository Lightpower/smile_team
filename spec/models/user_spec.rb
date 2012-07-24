require 'spec_helper'

describe User do

  it { should have_many(:events)}
  it { should have_many(:invites)}
  it { should have_many(:events).through(:invites)}

  it { should belong_to(:group)}

  it { should have_db_column(:group_id).of_type(:integer)}
  it { should have_db_column(:site_role).of_type(:string) }
  it { should have_db_column(:team_role).of_type(:string) }
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:birthday).of_type(:date) }
  it { should have_db_column(:game_count).of_type(:integer) }
  it { should have_db_column(:scores).of_type(:integer) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
  it { should have_db_column(:email).of_type(:string).with_options({default: "", null: false}) }
  it { should have_db_column(:encrypted_password).of_type(:string).with_options({default: "", null: false}) }
  it { should have_db_column(:reset_password_token).of_type(:string) }
  it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
  it { should have_db_column(:remember_created_at).of_type(:datetime) }
  it { should have_db_column(:sign_in_count).of_type(:integer).with_options({default: 0}) }
  it { should have_db_column(:current_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:last_sign_in_at).of_type(:datetime) }
  it { should have_db_column(:current_sign_in_ip).of_type(:string) }
  it { should have_db_column(:last_sign_in_ip).of_type(:string) }
  it { should have_db_column(:login).of_type(:string) }
  it { should have_db_column(:is_enabled).of_type(:boolean).with_options({default: true, null: false}) }

  it { should have_db_index(:email).unique(true) }
  it { should have_db_index(:login) }
  it { should have_db_index(:reset_password_token).unique(true) }

  describe 'methods' do
    before :each do
      @user = FactoryGirl.create(:guest_user)
    end

    it "define is_admin?" do
      user_admin = FactoryGirl.create(:admin_user)
      @user.is_admin?.should be_false
      user_admin.is_admin?.should be_true
    end
  end

end