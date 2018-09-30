class AutoShouldaMatchers
  attr_accessor :selected_model

  def initialize(selected_model)
    @model = selected_model
    create_spec
  end

  def create_spec
    new_spec = "#{Rails.root}/spec/models/#{@model.to_s.underscore}_spec.rb"
    File.open(new_spec, "w") do |f|
      f.write content
    end
  end

  def content(txt = "")
    txt << "require \"rails_helper\"\n"
    txt << "RSpec.describe #{@model.to_s}, type: :model do\n"
    txt << "  it \"has a valid factory\" do\n"
    txt << "    expect(FactoryBot.build :#{@model.to_s.underscore}).to be_valid\n"
    txt << "  end\n"
    txt << "\n"
    txt << "  describe \"associations\" do\n"
    @model.reflect_on_all_associations(:belongs_to).each do |a|
      txt << "    it { should belong_to :#{a.name} }\n"
    end
    @model.reflect_on_all_associations(:has_many).each do |a|
      txt << "    it { should have_many :#{a.name} }\n"
    end
    @model.reflect_on_all_associations(:has_one).each do |a|
      txt << "    it { should have_one :#{a.name} }\n"
    end
    txt << "  end\n"
    txt << "\n"

    txt << "  describe \"validations\" do\n"
    @model.validators.each do |v|
      if v.to_s.include?("Presence")
        v.attributes.each do |att|
          txt << "    it { should validate_presence_of :#{att} }\n"
        end
      elsif v.to_s.include?("Length")
        v.attributes.each do |att|
          txt << "    it { should validate_length_of(:#{att}).is_at_least(#{v.options[:minimum]}).is_at_most(#{v.options[:maximum]}) }\n"
        end
      elsif v.to_s.include?("Uniqueness")
        v.attributes.each do |att|
          txt << "    it { should validate_uniqueness_of(:#{att}) }\n"
        end
      else
        txt << "# It seems model has some custom validations\n"
      end
    end
    txt << "  end\n"
    txt << "end\n"
    txt
  end
end
