FactoryGirl.define do
  factory :pic do
    title 'Our First Pic'
    description 'Something beautiful'
    user nil

    factory :admin_pic
  end
end
