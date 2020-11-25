# == Schema Information
#
# Table name: urls
#
#  id          :bigint           not null, primary key
#  original_url         :text             not null
#  uuid        :text             default("uuid_generate_v4()"), not null
#  counter :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class UrlRecord < ApplicationRecord
end
