
# == Schema Information
#2 #
#3# Table name: users
#4 #
#5 # id:integer not null, primary key
#6 #  email :string  default(""), not null
#7 #  encrypted_password     :string           default(""), not null
# #8 #  reset_password_token   :string
#                         9 #  reset_password_sent_at :datetime
#                           10 #  remember_created_at    :datetime
#                             11 #  sign_in_count          :integer          default("0"), not null
#                               12 #  current_sign_in_at     :datetime
#                                 13 #  last_sign_in_at        :datetime
#                                   14 #  current_sign_in_ip     :inet
#                                     15 #  last_sign_in_ip        :inet
#                                       16 #  created_at             :datetime         not null
#                                         17 #  updated_at             :datetime         not null
#                                           18 #  username               :string
#                                             19 #  description            :text
#                                               20 #  avatar                 :string
#                                                 21 #  provider               :string

FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
