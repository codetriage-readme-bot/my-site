FactoryGirl.define do
  factory :user do
    email "user@email.com"
    password "secretsecret"
    
    factory :admin do
      email "lusersks@gmail.com"
    end
  end
end
