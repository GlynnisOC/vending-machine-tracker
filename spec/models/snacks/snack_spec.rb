require 'rails_helper'

RSpec.describe Snack, type: :model do
  describe 'validations' do
    it { should have_many :machines }
  end
end
