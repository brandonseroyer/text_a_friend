require 'rails_helper'

describe Contact do
  it {should validate_presence_of :name}
  it {should validate_presence_of :number}
  it {should belong_to :user}
end
