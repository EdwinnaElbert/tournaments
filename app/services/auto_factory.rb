class AutoFactory
  attr_accessor :selected_model

  def initialize(selected_model)
    @model = selected_model
    create_factory
  end

  def create_factory
    new_factory = "#{Rails.root}/spec/factories/#{@model.to_s.underscore}_factory.rb"
    File.open(new_factory, "w") do |f|
      f.write content
    end
  end

  def content(txt = "")
    txt << "# frozen_string_literal: true\n"
    txt << "\n"
    txt << "FactoryBot.define do\n"
    txt << "  factory :#{@model.to_s.underscore} do\n"
    @model.columns_hash.reject { |h| h == "created_at" || h == "updated_at" || h == "id" }.values.each do |attribute|
      if attribute.name.include?("_id")
        txt << "    association :#{attribute.name.gsub("_id", "")}\n"
      elsif attribute.type == :boolean
        txt << "    #{attribute.name} true\n"
      elsif attribute.type == :string && attribute.name != "email" && !attribute.name.include?("password")
        txt << "    #{attribute.name} { Faker::Alphanumeric.alphanumeric(10) }\n"
      elsif attribute.name == "email"
        txt << "    #{attribute.name} { Faker::Internet.email }\n"
      elsif attribute.name.include?("password")
        txt << "    #{attribute.name} { Faker::Internet.password }\n"
      elsif attribute.type == :integer
        txt << "    #{attribute.name} { Faker::Number.within(1..400) }\n"
      elsif attribute.type == :datetime
        txt << "    #{attribute.name} { Faker::Date.between(2.days.ago, Date.today) }\n"
      elsif attribute.type == :text
        txt << "    #{attribute.name} { Faker::Alphanumeric.alphanumeric(10) }\n"
      end
    end
    txt << "  end\n"
    txt << "end\n"
  end
end
