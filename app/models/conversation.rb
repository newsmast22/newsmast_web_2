# frozen_string_literal: true

# == Schema Information
#
# Table name: conversations
#
#  id                :bigint(8)        not null, primary key
#  uri               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_account_id :bigint(8)
#  parent_status_id  :bigint(8)
#

class Conversation < ApplicationRecord
  validates :uri, uniqueness: true, if: :uri?

  has_many :statuses, dependent: nil

  def local?
    uri.nil?
  end
end
